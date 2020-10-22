USE tech_store
GO

/* Trigger for updating stat_update for table payment based on pay_status */
IF exists (SELECT * FROM sys.objects WHERE [name] = N'TR_paystatus_afterupdate' and [type] = 'TR')
BEGIN
      DROP TRIGGER TR_paystatus_afterupdate;
END
GO

CREATE TRIGGER TR_paystatus_afterupdate ON payment AFTER UPDATE AS
IF TRIGGER_NESTLEVEL() <= 1 and UPDATE (pay_status)
	IF exists (
		SELECT inserted.pay_status
		FROM inserted, deleted
		WHERE inserted.pay_status = 'ordered' and deleted.pay_status = 'paid'
	)
	BEGIN

		ROLLBACK TRANSACTION;
		PRINT('WARNING: Cannot change pay_status in "payment" from "paid" to "ordered".');

	END
	ELSE IF exists (
		SELECT inserted.pay_status
		FROM inserted, deleted
		WHERE inserted.pay_status != deleted.pay_status
	)
	BEGIN

		UPDATE stored_in
		SET count_available = count_available - Product.Total, count_ordered = count_ordered - Product.Total
		FROM (
			SELECT ser_num, SUM(count_items) AS Total
			FROM included_in, inserted
			WHERE included_in.pay_code = inserted.code
			GROUP BY ser_num
		) AS Product, inserted
		WHERE Product.ser_num = stored_in.ser_num AND stored_in.shop_add = inserted.shop_add;

		UPDATE payment SET stat_update = GETDATE() FROM inserted WHERE payment.code = inserted.code;

	END

GO


/* Trigger for updating stat_update for table payment based on pay_status */
IF exists (SELECT * FROM sys.objects WHERE [name] = N'TR_tracknum_log' and [type] = 'TR')
BEGIN
      DROP TRIGGER TR_tracknum_log;
END
GO

CREATE TRIGGER TR_tracknum_log ON client AFTER UPDATE, DELETE AS
INSERT INTO client_audit (num, names, email, phone, client_add)
SELECT deleted.num, deleted.names, deleted.email, deleted.phone, deleted.client_add
FROM deleted;
GO


/* Trigger for inserting into stored_in and updating available items counter */
IF exists (SELECT * FROM sys.objects WHERE [name] = N'TR_insert_storedin' and [type] = 'TR')
BEGIN
      DROP TRIGGER TR_insert_storedin;
END
GO

CREATE TRIGGER TR_insert_storedin ON stored_in INSTEAD OF INSERT AS
IF TRIGGER_NESTLEVEL() <= 1
BEGIN

	IF EXISTS (
	(
		SELECT shop_add, ser_num
		FROM stored_in
	)
		INTERSECT
		(
			SELECT shop_add, ser_num
			FROM inserted
		)
	)
	BEGIN

	UPDATE stored_in
	SET stored_in.count_available = stored_in.count_available + inter.Total
	FROM (
		SELECT inserted.shop_add, inserted.ser_num, SUM(inserted.count_available) AS Total
		FROM inserted
		GROUP BY inserted.shop_add, inserted.ser_num
	) AS inter
	WHERE stored_in.shop_add = inter.shop_add AND stored_in.ser_num = inter.ser_num

	END

	IF EXISTS (
		SELECT shop_add, ser_num
		FROM inserted
		EXCEPT
		SELECT shop_add, ser_num
		FROM stored_in
	)
	BEGIN

	INSERT INTO stored_in (shop_add, ser_num, count_available) 
		SELECT ShopAddress, SerialNumber, CountAvailable
		FROM (
		SELECT inserted.shop_add AS ShopAddress, inserted.ser_num AS SerialNumber, SUM(inserted.count_available) AS CountAvailable
			FROM (
				SELECT shop_add, ser_num
				FROM inserted
				EXCEPT
				SELECT shop_add, ser_num
				FROM stored_in
			) AS diff, inserted
			WHERE diff.ser_num = inserted.ser_num AND diff.shop_add = inserted.shop_add
		GROUP BY inserted.shop_add, inserted.ser_num
		) AS random

	END

END

GO


/* Trigger for inserting into included_in and updating ordered items counter */
IF exists (SELECT * FROM sys.objects WHERE [name] = N'TR_insert_includedin' and [type] = 'TR')
BEGIN
      DROP TRIGGER TR_insert_includedin;
END
GO


CREATE TRIGGER TR_insert_includedin ON included_in AFTER INSERT AS
IF TRIGGER_NESTLEVEL() <= 1
BEGIN

	DECLARE @ITEMCOUNT int;
	DECLARE @COUNTAVAILABLE int;
	DECLARE @COUNTORDERED int;
	DECLARE @SHOPADDRESS VARCHAR(50);

	SET @COUNTAVAILABLE = 0;
	SET @COUNTORDERED = 0;

	SET @SHOPADDRESS = (
	SELECT shop_add
	FROM payment, inserted
	WHERE payment.code = inserted.pay_code
	)

	IF EXISTS (
		SELECT count_available
		FROM inserted, stored_in, shop
		WHERE inserted.ser_num = stored_in.ser_num AND stored_in.shop_add = shop.shop_add
	)
		SET @COUNTAVAILABLE = (
		SELECT count_available
		FROM inserted, stored_in, shop
		WHERE inserted.ser_num = stored_in.ser_num AND stored_in.shop_add = shop.shop_add
		)

	IF EXISTS (
		SELECT count_ordered
		FROM inserted, stored_in, shop
		WHERE inserted.ser_num = stored_in.ser_num AND stored_in.shop_add = shop.shop_add
	)
	SET @COUNTORDERED = (
		SELECT count_ordered
		FROM inserted, stored_in, shop
		WHERE inserted.ser_num = stored_in.ser_num AND stored_in.shop_add = shop.shop_add
	)

	SET @ITEMCOUNT = (
		SELECT inserted.count_items
		FROM inserted
	)

	IF (@ITEMCOUNT > (@COUNTAVAILABLE - @COUNTORDERED))
	DELETE FROM payment WHERE code = (
		SELECT pay_code
		FROM inserted
	)
	ELSE
		UPDATE stored_in SET count_ordered = count_ordered + @ITEMCOUNT
		FROM inserted
		WHERE stored_in.ser_num = inserted.ser_num AND stored_in.shop_add = @SHOPADDRESS

END
