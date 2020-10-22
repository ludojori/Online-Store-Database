USE tech_store
GO

ALTER TABLE tech ADD CONSTRAINT PK_tech PRIMARY KEY (ser_num);

ALTER TABLE it_tech ADD CONSTRAINT PK_it_tech PRIMARY KEY (ser_num);
ALTER TABLE it_tech ADD CONSTRAINT FK_it_tech_tech FOREIGN KEY (ser_num) REFERENCES tech (ser_num);

ALTER TABLE audio_tech ADD CONSTRAINT PK_audio_tech PRIMARY KEY (ser_num);
ALTER TABLE audio_tech ADD CONSTRAINT FK_audio_tech_tech FOREIGN KEY (ser_num) REFERENCES tech (ser_num);

ALTER TABLE white_tech ADD CONSTRAINT PK_white_tech PRIMARY KEY (ser_num);
ALTER TABLE white_tech ADD CONSTRAINT FK_white_tech_tech FOREIGN KEY (ser_num) REFERENCES tech (ser_num);

ALTER TABLE client ADD CONSTRAINT PK_client PRIMARY KEY (email);

ALTER TABLE payment ADD CONSTRAINT PK_payment PRIMARY KEY (code);
ALTER TABLE payment ADD CONSTRAINT FK_payment_client FOREIGN KEY (client_email) REFERENCES client (email);

ALTER TABLE shop ADD CONSTRAINT PK_shop PRIMARY KEY (shop_add);

ALTER TABLE stored_in ADD CONSTRAINT FK_stored_in_tech FOREIGN KEY (ser_num) REFERENCES tech (ser_num);
ALTER TABLE stored_in ADD CONSTRAINT FK_stored_in_shop FOREIGN KEY (shop_add) REFERENCES shop (shop_add);

ALTER TABLE included_in ADD CONSTRAINT FK_included_in_payment FOREIGN KEY (pay_code) REFERENCES payment (code);
ALTER TABLE included_in ADD CONSTRAINT FK_included_in_tech FOREIGN KEY (ser_num) REFERENCES tech (ser_num);

ALTER TABLE purchased_from ADD CONSTRAINT FK_purchased_from_client FOREIGN KEY (client_email) REFERENCES client (email);
ALTER TABLE purchased_from ADD CONSTRAINT FK_purchased_from_shop FOREIGN KEY (shop_add) REFERENCES shop (shop_add);
