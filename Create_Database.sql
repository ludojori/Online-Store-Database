USE master
GO

IF exists (SELECT * FROM sysdatabases WHERE NAME = 'tech_store')
BEGIN
	ALTER DATABASE tech_store SET SINGLE_USER WITH ROLLBACK IMMEDIATE
	DROP DATABASE tech_store
END
GO

CREATE DATABASE tech_store
GO
USE tech_store
GO

CREATE TABLE tech (
ser_num CHAR(8) NOT NULL,
brand VARCHAR(20) NOT NULL,
model VARCHAR(30) NOT NULL,
type_tech VARCHAR(20) NOT NULL,
price decimal(10, 2) NOT NULL
);

ALTER TABLE tech ADD CONSTRAINT PK_tech PRIMARY KEY (ser_num);
ALTER TABLE tech ADD CONSTRAINT chk_ser_tech CHECK (LEN(ser_num) = 8);
ALTER TABLE tech ADD CONSTRAINT df_type_tech DEFAULT 'undefined' FOR type_tech;
ALTER TABLE tech ADD CONSTRAINT chk_price_tech CHECK (price >= 0);
CREATE INDEX idx_tech_model ON tech (model);
GO

CREATE TABLE it_tech (
ser_num CHAR(8) NOT NULL,
cpu VARCHAR(40) NOT NULL,
gpu VARCHAR(40) NOT NULL,
ram VARCHAR(20) NOT NULL,
memory VARCHAR(40) NOT NULL,
camera VARCHAR(50),
display VARCHAR(50),
battery VARCHAR(20)
);

ALTER TABLE it_tech ADD CONSTRAINT PK_ittech PRIMARY KEY (ser_num);
ALTER TABLE it_tech ADD CONSTRAINT FK_ittech_tech FOREIGN KEY (ser_num) REFERENCES tech (ser_num) ON DELETE Cascade ON UPDATE Cascade;
ALTER TABLE it_tech ADD CONSTRAINT chk_ser_ittech CHECK (LEN(ser_num) = 8);
ALTER TABLE it_tech ADD CONSTRAINT df_gpu_ittech DEFAULT 'none' FOR gpu;
GO

CREATE TABLE audio_tech (
ser_num CHAR(8) NOT NULL,
sound_hz VARCHAR(20) NOT NULL,
pow_watts VARCHAR(10) NOT NULL,
battery VARCHAR(20)
);

ALTER TABLE audio_tech ADD CONSTRAINT PK_audiotech PRIMARY KEY (ser_num);
ALTER TABLE audio_tech ADD CONSTRAINT FK_audiotech_tech FOREIGN KEY (ser_num) REFERENCES tech (ser_num) ON DELETE Cascade ON UPDATE Cascade;
ALTER TABLE audio_tech ADD CONSTRAINT chk_ser_audiotech CHECK (LEN(ser_num) = 8);
GO

CREATE TABLE white_tech (
ser_num CHAR(8) NOT NULL,
dimensions VARCHAR(20) NOT NULL,
power_watts VARCHAR(10) NOT NULL,
class VARCHAR(10),
volume VARCHAR(10) NOT NULL
);

ALTER TABLE white_tech ADD CONSTRAINT PK_whitetech PRIMARY KEY (ser_num);
ALTER TABLE white_tech ADD CONSTRAINT FK_whitetech_tech FOREIGN KEY (ser_num) REFERENCES tech (ser_num) ON DELETE Cascade ON UPDATE Cascade;
ALTER TABLE white_tech ADD CONSTRAINT chk_ser_whitetech CHECK (LEN(ser_num) = 8);
GO

CREATE TABLE client (
num int NOT NULL,
names VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
phone VARCHAR(20) NOT NULL,
client_add VARCHAR(50) NOT NULL
);

ALTER TABLE client ADD CONSTRAINT chk_num_client UNIQUE (num), CHECK (num >= 0);
ALTER TABLE client ADD CONSTRAINT PK_client PRIMARY KEY (email);
ALTER TABLE client ADD CONSTRAINT chk_email_client CHECK (email like '%@%.%' and LEN(email) >= 6);
ALTER TABLE client ADD CONSTRAINT df_phone_client DEFAULT '--- -------' FOR phone;
GO

CREATE TABLE client_audit (
num int NOT NULL,
names VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
phone VARCHAR(20) NOT NULL,
client_add VARCHAR(50) NOT NULL,
track_num int NOT NULL IDENTITY(1,1),
changed DATETIME
);

ALTER TABLE client_audit ADD CONSTRAINT PK_track_num_client_audit PRIMARY KEY (track_num);
ALTER TABLE client_audit ADD CONSTRAINT df_changed_client_audit DEFAULT GETDATE() FOR changed;
GO

CREATE TABLE shop (
num int NOT NULL,
shop_add VARCHAR(50) NOT NULL,
phone VARCHAR(20) NOT NULL
);

ALTER TABLE shop ADD CONSTRAINT chk_shop CHECK (num >= 0);
ALTER TABLE shop ADD CONSTRAINT PK_shop PRIMARY KEY (shop_add);
ALTER TABLE shop ADD CONSTRAINT uniq_num_shop UNIQUE (num);
ALTER TABLE shop ADD CONSTRAINT chk_num_shop CHECK (num >= 0);
ALTER TABLE shop ADD CONSTRAINT df_phone_shop DEFAULT '--- -------' FOR phone;
GO

CREATE TABLE payment (
code int NOT NULL,
client_email VARCHAR(50) NOT NULL,
shop_add VARCHAR(50) NOT NULL,
pay_status CHAR(7) NOT NULL,
created DATETIME,
stat_update DATETIME
);

ALTER TABLE payment ADD CONSTRAINT PK_payment PRIMARY KEY (code);
ALTER TABLE payment ADD CONSTRAINT FK_payment_client FOREIGN KEY (client_email) REFERENCES client (email) ON DELETE Cascade ON UPDATE Cascade;
ALTER TABLE payment ADD CONSTRAINT FK_payment_shop FOREIGN KEY (shop_add) REFERENCES shop (shop_add) ON DELETE Cascade ON UPDATE Cascade;
ALTER TABLE payment ADD CONSTRAINT chk_email_payment CHECK (client_email like '%@%.%' and LEN(client_email) >= 6);
ALTER TABLE payment ADD CONSTRAINT chk_code_payment CHECK (code >= 0);
ALTER TABLE payment ADD CONSTRAINT chk_status_payment CHECK(pay_status in ('ordered', 'paid'));
ALTER TABLE payment ADD CONSTRAINT df_created_payment DEFAULT GETDATE() FOR created;
ALTER TABLE payment ADD CONSTRAINT df_stat_upd_payment DEFAULT GETDATE() FOR stat_update;
GO

CREATE TABLE stored_in (
shop_add VARCHAR(50) NOT NULL,
ser_num CHAR(8) NOT NULL,
count_available int,
count_ordered int
);

ALTER TABLE stored_in ADD CONSTRAINT FK_stin_tech FOREIGN KEY (ser_num) REFERENCES tech (ser_num) ON DELETE CASCADE ON UPDATE Cascade;
ALTER TABLE stored_in ADD CONSTRAINT FK_stin_shop FOREIGN KEY (shop_add) REFERENCES shop (shop_add) ON DELETE Cascade ON UPDATE Cascade;
ALTER TABLE stored_in ADD CONSTRAINT chk_ser_stin CHECK (LEN(ser_num) = 8);
ALTER TABLE stored_in ADD CONSTRAINT chk_countav_storedin CHECK (count_available >= 0);
ALTER TABLE stored_in ADD CONSTRAINT chk_countor_storedin CHECK (count_ordered >= 0);
ALTER TABLE stored_in ADD CONSTRAINT df_countav_storedin DEFAULT 0 FOR count_available;
ALTER TABLE stored_in ADD CONSTRAINT df_countor_storedin DEFAULT 0 FOR count_ordered;
GO

CREATE TABLE included_in (
pay_code int NOT NULL,
ser_num CHAR(8) NOT NULL,
count_items int
);

ALTER TABLE included_in ADD CONSTRAINT FK_inclin_payment FOREIGN KEY (pay_code) REFERENCES payment (code) ON DELETE Cascade ON UPDATE Cascade;
ALTER TABLE included_in ADD CONSTRAINT FK_inclin_tech FOREIGN KEY (ser_num) REFERENCES tech (ser_num) ON DELETE Cascade ON UPDATE Cascade;
ALTER TABLE included_in ADD CONSTRAINT chk_ser_inclin CHECK (LEN(ser_num) = 8);
ALTER TABLE included_in ADD CONSTRAINT df_countitems_inclin DEFAULT 1 FOR count_items;
GO

CREATE TABLE purchased_from (
client_email VARCHAR(50) NOT NULL,
shop_add VARCHAR(50) NOT NULL
);

ALTER TABLE purchased_from ADD CONSTRAINT FK_purfrom_client FOREIGN KEY (client_email) REFERENCES client (email) ON DELETE Cascade ON UPDATE Cascade;
ALTER TABLE purchased_from ADD CONSTRAINT FK_purfrom_shop FOREIGN KEY (shop_add) REFERENCES shop (shop_add) ON DELETE Cascade ON UPDATE Cascade;
ALTER TABLE purchased_from ADD CONSTRAINT chk_email_purfrom CHECK (client_email like '%@%.%' and LEN(client_email) >= 6);
GO
