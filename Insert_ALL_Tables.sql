USE tech_store
GO

/* TABLE: tech */
INSERT INTO tech (ser_num, brand, model, type_tech, price) VALUES
('10000000','ACER','ASPIRE TC-885 DT.BAPEX.013','PC',1199),
('10000001','ACER','ASPIRE C22-860 AIO','PC',999),
('10000002','ACER','Nitro N50-110 DG.E1FEX.007','PC',1389),
('10000003','LENOVO','T540-15ICK 90LW004SRM','PC',1399),
('10000004','LENOVO','LEGION T530-28ICB 90JL003NBG','PC',1799),
('10000005','ACER','NITRO N50-600','PC',1599),
('10000006','GPLAY','FATALITY RGB','PC',1599),

('10000007','ASUS','UX362FA-EL207T','Laptop',1999),
('10000008','ASUS','G531GT-AL010','Laptop',1999),
('10000009','ASUS','G731GU-EV011','Laptop',2449),
('10000010','ACER','NITRO 5 AN515-54-7064','Laptop',1759),
('10000011','ACER','HELIOS 300 PH317-53-71U2','Laptop',3199),
('10000012','ACER','HELIOS 300 PH315-52-707V','Laptop',2799),
('10000013','ASUS','UX434FL-A6009T','Laptop',2199),

('10000014','HUAWEI','P30 DS BLACK','Smartphone',849),
('10000015','HUAWEI','NOVA 5T BLUE','Smartphone',649),
('10000016','HUAWEI','MATE XS BLUE','Smartphone',4999),
('10000017','SAMSUNG','GALAXY S10 128GB GREEN','Smartphone',1150),
('10000018','SAMSUNG','GALAXY A71 A715F DS SILVER','Smartphone',889),
('10000019','APPLE','IPHONE 7 BLACK','Smartphone',689),
('10000020','APPLE','IPHONE 11 BLACK','Smartphone',1590),

('10000021','NEO','Wm-S6010Nw','Washing machine',329),
('10000022','INDESIT','Indesit Bwsa-51052 W Eu','Washing machine',399),
('10000023','GORENJE','Gorenje We62S3','Washing machine',469),
('10000024','ELECTROLUX','Electrolux Ew6S406W','Washing machine',499),
('10000025','SAMSUNG','Samsung Ww70J5246Fx/le','Washing machine',649),
('10000026','AEG','L6Fbi27W','Washing machine',689),
('10000027','AEG','L7Fee48S','Washing machine',949),

('10000028','NEO','Bcg-260A+','Refrigerator',298),
('10000029','BEKO','Rdsa 240 K20W','Refrigerator',359),
('10000030','ATLANTIC','At-263 A+','Refrigerator',369),
('10000031','NEO','Bcg-260 Dsa+','Refrigerator',389),
('10000032','AMICA','Fd2325.3','Refrigerator',439),
('10000033','INDESIT','Raa-24 N (Eu)','Refrigerator',449),
('10000034','LIEBHERR','Sbs 66I2','Refrigerator',5119),

('10000035','SIMFER','F.5043Sebb','Cooker',329),
('10000036','AMICA','58Ee2.20Epfw','Cooker',399),
('10000037','NEO','E-6065Mf-Tr','Cooker',399),
('10000038','GORENJE','Gorenje E5121Wh','Cooker',419),
('10000039','INDESIT','I5Esh1E(W)','Cooker',429),
('10000040','ZANUSSI','Zcv-550G1Wa','Cooker',599),
('10000041','GORENJE','Gorenje Ec5241Sg','Cooker',599),

('10000042','JAMO','J-10 Sub Black','Subwoofer',359),
('10000043','JAMO','S 807','Speakers',599),
('10000044','JAMO','S-626 Black Ash','Three-Strip Column',599),
('10000045','CANYON','CNE-CBTSP6','Bluetooth speaker',34.9),
('10000046','TRACER','GUNMAN BLUE','Headset',49),
('10000047','HYPER X','CL STINGER CORE HX-HSCSC-BK','Headset',69),
('10000048','ASTRO','A50 WS+Base PS4 BK/BL 939-0015','Headset',599.99);
GO

/* TABLE: it_tech */
INSERT INTO it_tech (ser_num, cpu, gpu, ram, memory, display) VALUES
('10000000', 'INTEL CORE i3-7130U 2.7GHz 3MB', 'INTEL HD GRAPHICS 620', '8 GB DDR4', '1000 GB HDD', '21.5" (1920x1080) IPS, MAT');
INSERT INTO it_tech (ser_num, cpu, gpu, ram, memory) VALUES
('10000001', 'INTEL CORE i5-8400 2.8GHz 9MB', 'NVIDIA GEFORCE GT 1030 2 GB', '8 GB DDR4', '1000 GB HDD'),
('10000002', 'AMD Ryzen 5 3500 3.6 GHz 16 MB', 'NVIDIA GeForce GTX 1650 4GB', '8 GB DDR4', '256 GB SSD'),
('10000003', 'INTEL Core i5-9400F 2.9GHz 9MB', 'NVIDIA GeForce GTX1660 6 GB', '8 GB DDR4', '256 GB SSD, 1000 GB HDD'),
('10000004', 'INTEL CORE i7-8700 3.2GHz 12MB', 'NVIDIA GEFORCE GTX 1050Ti 4 GB', '8 GB DDR4', '128 GB SSD, 1000 GB HDD'),
('10000005', 'INTEL CORE i5-8400 2.8GHz 9MB', 'NVIDIA GEFORCE GTX 1050Ti 4 GB', '8 GB DDR4', '128 GB SSD, 1000 GB HDD'),
('10000006', 'AMD RYZEN 5 3600 3.6 GHz 32 MB', 'XFX AMD RADEON RX590 8 GB', '8 GB DDR4', '240 GB SSD, 1000 GB HDD');

INSERT INTO it_tech (ser_num, cpu, gpu, ram, memory, camera, display, battery) VALUES
('10000007', 'INTEL CORE i5-8265U', 'INTEL UHD GRAPHICS 620', '8 GB LPDDR3', '512 GB SSD', 'FRONT', '13.3" (1920x1080) GLARE, TOUCH', '3 CELL'),
('10000008', 'INTEL CORE i7-9750H', 'NVIDIA GEFORCE GTX1650 4 GB GDDR5', '8 GB DDR4', '256 GB SSD, 1000 GB HDD', 'FRONT', '15.6" (1920x1080)', '3 CELL LI-ION'),
('10000009', 'INTEL CORE i7-9750H', 'NVIDIA GEFORCE GTX1660Ti 6 GB GDDR6', '8 GB DDR4', '512 GB SSD', 'FRONT', '17.3" (1920x1080)', '4 CELL LI-ION'),
('10000010', 'INTEL CORE i7-9750H', 'NVIDIA GEFORCE GTX1650 4 GB GDDR5', '8 GB DDR4', '1000 GB HDD', 'FRONT', '15.6" (1920x1080) IPS, MAT, 144Hz', '4 CELL'),
('10000011', 'INTEL CORE i7-9750H', 'NVIDIA GEFORCE RTX2060 6 GB GDDR6', '16 GB DDR4', '256 GB SSD, 1000 GB HDD', 'FRONT', '17.3" (1920x1080)', '4 CELL'),
('10000012', 'INTEL CORE i7-9750H', 'NVIDIA GEFORCE GTX1660Ti 6 GB GDDR6', '8 GB DDR4', '256 GB SSD, 1000 GB HDD', 'FRONT', '15.6" (1920x1080) IPS, MAT, 144Hz', '4 CELL'),
('10000013', 'INTEL CORE I7-8565U', 'NVIDIA GEFORCE MX250', '8 GB DDR4', '512 GB SSD', 'FRONT', '14.0" (1920x1080)', '3 CELL LI-ION');

INSERT INTO it_tech (ser_num, cpu, ram, memory, camera, display, battery) VALUES
('10000014', '2x2.6GHz+2x1.92GHz+ 4x1.8GHz', '6 GB', '128 GB', 'REAR TRIPLE 40+16+8MP, FRONT 32MP', '6.10" (1080x2340) OLED TOUCHSCREEN', '3650 mAh'),
('10000015', '2x2.6GHz+2x1.92GHz+ 4x1.8GHz', '6 GB', '128 GB', 'REAR QUAD 48+16+2+2MP, FRONT 32MP', '6.26" (1080x2340) LTPS CAPACITIVE TOUCHSCREEN', '3750 mAh'),
('10000016', 'HUAWEI Kirin 990 5G', '8 GB', '512 GB', 'REAR QUAD 48+16+8+TOF, FRONT QUAD 48+16+8+TOF', '6.60" (2480x1148) OLED TOUCHSCREEN', '4500 mAh Li-ion'),
('10000017', '2x2.7GHz+2x2.3GHz+ 4x1.9GHz', '8 GB', '128 GB', 'REAR TRIPLE 12+12+16MP, FRONT 10MP', '6.10" (1440x3040) DYNAMIC AMOLED TOUCHSCREEN', '3400 mAh'),
('10000018', '2.2GHz Dual+1.8GHz Hexa-core', '6 GB', '128 GB', 'REAR QUAD 64+12+5+5MP, FRONT 32MP', '6.70" (1080x2400) SUPER AMOLED TOUCHSCREEN', '4500 mAh Li-Po'),
('10000019', 'APPLE A10 64-bit', '2 GB', '32 GB', 'REAR 12MP, FRONT 7MP', '4.70" (750x1334) RETINA HD 3D TOUCHSCREEN', '1960 mAh Li-ion'),
('10000020', 'A13 Bionic', '4 GB', '64 GB', 'REAR DOUBLE 12+12MP, FRONT 12MP', '6.10" (1792x828) Retina HD', '3110 mAh Li-ion');
GO

/* TABLES: white_tech */
INSERT INTO white_tech (ser_num, dimensions, power_watts, class, volume) VALUES
('10000021','85.0/60.0/44.0 cm.','0 W','A++','6 kg'),
('10000022','85.0/59.5/42.5 cm.','0 W','A++','5 kg'),
('10000023','85.0/60.0/43.0 cm.','0 W','A+++','5 kg'),
('10000024','84.5/59.5/38.0 cm.','0 W','A+++','6 kg'),
('10000025','85.0/60.0/55.0 cm.','0 W','A+++','7 kg'),
('10000026','85.0/60.0/57.5 cm.','0 W','A+++','7 kg'),
('10000027','85.0/60.0/57.1 cm.','0 W','A+++','8 kg');

INSERT INTO white_tech (ser_num, dimensions, power_watts, class, volume) VALUES
('10000028','143.0/54.5/56.6 cm.','0 W','A+','205 L'),
('10000029','147.0/54.0/60.0 cm.','0 W','A+','223 L'),
('10000030','144.0/54.0/57.0 cm.','0 W','A+','213 L'),
('10000031','143.7/54.5/55.3 cm.','0 W','A+','204 L'),
('10000032','143.7/54.8/59.0 cm.','0 W','A+','208 L'),
('10000033','140.0/55.0/60.6 cm.','0 W','A+','226 L'),
('10000034','178.8/57.0/55.0 cm.','0 W','A++','283 L');

INSERT INTO white_tech (ser_num, dimensions, power_watts, class, volume) VALUES
('10000035','86.0/49.8/61.0 cm.','7300 W','A','48 L'),
('10000036','85.0/50.0/60.0 cm.','7300 W','A','62 L'),
('10000037','85.0/60.0/60.0 cm.','0 W','B','57 L'),
('10000038','85.0/50.0/59.4 cm.','8300 W','A','68 L'),
('10000039','85.0/50.0/60.0 cm.','7000 W','A','61 L'),
('10000040','85.8/50.0/60.0 cm.','8485 W','A','54 L'),
('10000041','85.0/50.0/59.4 cm.','8600 W','A','63 L');
GO

/* TABLE: audio_tech */
INSERT INTO audio_tech (ser_num, sound_hz, pow_watts, battery) VALUES
('10000042','40-120Hz','150 W','cable'),
('10000043','42Hz-26Khz','200 W','cable'),
('10000044','42-20000Hz','210 W','cable'),
('10000045','40-20000Hz','10 W','4h'),
('10000046','30-16000Hz','0 W','cable'),
('10000047','20-20000Hz','0 W','cable'),
('10000048','20-20000Hz','0 W','cable');
GO

/* TABLE: shop */
INSERT INTO shop (num, shop_add, phone) VALUES
(1, 'Varna, Slivnitsa 120', '087 8150600'),
(2, 'Burgas, Slaveikov 94', '088 9880270'),
(3, 'Plovdiv, Georgi Stranski 3', '088 8207470'),
(4, 'Sofia, Pancho Vladigerov 75', '02 8170102'),
(5, 'Varna, Republika 49', '052 579120'),
(6, 'Sofia, Alabin 35', '02 5791201'),
(7, 'Ruse, Hristo Botev 38', '087 7122323');
GO

/* TABLE: client */
INSERT INTO client (num, names, email, phone, client_add) VALUES
('738423','Martin Hristov','policai@abv.bg','088 7625123','Borova gora 18'),
('638424','Alexandar Todorov','alexxx69@gmail.com','088 9123635','Mladost 104'),
('538423','Milen Cvetanov','puss_slayer@gmail.com','089 9123588','Vasil Levski 70'),
('738426','Antoaneta Veselinska','xX_kote_Xx@abv.bg','088 1263574','Svoboda 14'),
('792392','Gergana Jordanova','gergana_1999@abv.bg','088 7253274','Suh dyb 03'),
('738428','Todor Georgiev','tarator@gmail.com','089 7672727','Tsveten konets 27'),
('123074','Hristo Dimitrov','jesus_with_u@gmail.com','088 6672737','General Racovski 89'),
('838423','Tsvetana Trifanova','samodiva_69@abv.bg','089 2342853','Gorsko hora 02'),
('349762','Dimitar Socolov','patriot_bg@abv.bg','089 9992341','Alen mak 23'),
('935723','Radomir Ivanov','eb_ach@gmail.com','088 7523463','Elenovo 87');
GO

/* TABLE: payment */
INSERT INTO payment (code, client_email, shop_add, pay_status) VALUES
('1000','alexxx69@gmail.com','Varna, Slivnitsa 120','ordered'),
('1001','gergana_1999@abv.bg','Burgas, Slaveikov 94','ordered'),
('1002','eb_ach@gmail.com','Plovdiv, Georgi Stranski 3','ordered'),

('1003','jesus_with_u@gmail.com','Sofia, Pancho Vladigerov 75','ordered'),
('1004','patriot_bg@abv.bg','Varna, Republika 49','ordered'),
('1005','policai@abv.bg','Ruse, Hristo Botev 38','ordered'),

('1006','puss_slayer@gmail.com','Sofia, Alabin 35','paid'),
('1007','alexxx69@gmail.com','Ruse, Hristo Botev 38','paid'),
('1008','samodiva_69@abv.bg','Ruse, Hristo Botev 38','paid'),

('1009','tarator@gmail.com','Sofia, Alabin 35','ordered'),
('1010','xX_kote_Xx@abv.bg','Varna, Republika 49','paid'),
('1011','patriot_bg@abv.bg','Sofia, Pancho Vladigerov 75','paid'),

('1012','xX_kote_Xx@abv.bg','Plovdiv, Georgi Stranski 3','ordered'),
('1013','policai@abv.bg','Burgas, Slaveikov 94','paid'),
('1014','gergana_1999@abv.bg','Varna, Slivnitsa 120','paid');
GO

/* TABLE: purchased_from */
INSERT INTO purchased_from (client_email, shop_add) VALUES
('alexxx69@gmail.com','Burgas, Slaveikov 94'),
('eb_ach@gmail.com','Plovdiv, Georgi Stranski 3'),
('gergana_1999@abv.bg','Burgas, Slaveikov 94'),
('jesus_with_u@gmail.com','Varna, Republika 49'),
('patriot_bg@abv.bg','Varna, Slivnitsa 120'),
('policai@abv.bg','Ruse, Hristo Botev 38'),
('puss_slayer@gmail.com','Sofia, Alabin 35'),
('samodiva_69@abv.bg','Varna, Slivnitsa 120'),
('tarator@gmail.com','Sofia, Pancho Vladigerov 75'),
('xX_kote_Xx@abv.bg','Sofia, Pancho Vladigerov 75');
GO

/* TABLE: stored_in */
INSERT INTO stored_in (shop_add, ser_num, count_available, count_ordered) VALUES
('Burgas, Slaveikov 94','10000000',40,0),
('Burgas, Slaveikov 94','10000009',50,0),
('Burgas, Slaveikov 94','10000020',60,1),
('Burgas, Slaveikov 94','10000030',40,0),

('Plovdiv, Georgi Stranski 3','10000008',40,2),
('Plovdiv, Georgi Stranski 3','10000013',50,1),
('Plovdiv, Georgi Stranski 3','10000017',60,2),
('Plovdiv, Georgi Stranski 3','10000023',40,0),
('Plovdiv, Georgi Stranski 3','10000029',40,3),

('Ruse, Hristo Botev 38','10000003',40,1),
('Ruse, Hristo Botev 38','10000011',50,0),
('Ruse, Hristo Botev 38','10000016',60,0),
('Ruse, Hristo Botev 38','10000037',40,3),

('Sofia, Alabin 35','10000004',40,0),
('Sofia, Alabin 35','10000027',40,0),
('Sofia, Alabin 35','10000040',40,0),
('Sofia, Alabin 35','10000042',70,0),
('Sofia, Alabin 35','10000044',40,4),

('Sofia, Pancho Vladigerov 75','10000005',70,3),
('Sofia, Pancho Vladigerov 75','10000026',40,0),
('Sofia, Pancho Vladigerov 75','10000029',40,0),
('Sofia, Pancho Vladigerov 75','10000038',70,2),
('Sofia, Pancho Vladigerov 75','10000043',70,0),
('Sofia, Pancho Vladigerov 75','10000044',70,0),
('Sofia, Pancho Vladigerov 75','10000045',70,4),

('Varna, Republika 49','10000005',40,0),
('Varna, Republika 49','10000015',40,3),
('Varna, Republika 49','10000032',40,0),
('Varna, Republika 49','10000045',70,0),

('Varna, Slivnitsa 120','10000009',70,2),
('Varna, Slivnitsa 120','10000015',60,0),
('Varna, Slivnitsa 120','10000046',70,0),
('Varna, Slivnitsa 120','10000047',70,0),
('Varna, Slivnitsa 120','10000048',70,0);
GO
--3, 5, 8, 9, 13, 15, 17, 20, 29, 37, 38, 44, 45, 48
/* TABLE: included_in */
INSERT INTO included_in (pay_code, ser_num, count_items) VALUES
--ordered:
('1000','10000009',2),
('1001','10000020',1),
('1002','10000017',2),
('1002','10000013',1),
('1002','10000008',2),
('1003','10000005',3),
('1003','10000045',4),
('1003','10000038',2),
('1004','10000015',3),
('1004','10000048',2),
('1005','10000037',3),
('1005','10000003',1),
('1009','10000044',4),
('1012','10000029',3),

--paid:
('1006','10000042',5),
('1006','10000040',2),
('1007','10000009',1),
('1007','10000030',2),
('1008','10000046',6),
('1010','10000026',2),
('1010','10000043',4),
('1011','10000047',5),
('1013','10000011',2),
('1013','10000016',4),
('1014','10000000',1);
GO

/* End of file. */