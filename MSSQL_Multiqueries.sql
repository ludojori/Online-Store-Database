USE tech_store
GO

--List all audio_tech products with price between 500 and 1000 and print their brand, model and price
SELECT tech.brand as Brand, tech.model as Model, tech.price as Price
FROM audio_tech, tech
WHERE tech.ser_num = audio_tech.ser_num and tech.price between 500 and 1000

--List all white_tech products with class "A+++" and print their serial number, brand and model
SELECT tech.ser_num as Serial, tech.brand as Brand, tech.model as Model
FROM white_tech, tech
WHERE tech.ser_num = white_tech.ser_num and class = 'A+++'

--List all it_tech products with brand name "Asus" or "Acer" and print their serial number, brand and model
SELECT tech.ser_num as Serial, brand as Brand, model as Model
FROM it_tech, tech
WHERE tech.ser_num = it_tech.ser_num and (brand = 'ASUS' or brand = 'ACER')

--List all products stored in shops in Sofia, print their brand and model, as well as the shop address
SELECT brand as Brand, model as Model, stored_in.shop_add as Address
FROM tech, stored_in
WHERE tech.ser_num = stored_in.ser_num and stored_in.shop_add like 'Sofia%'

--Print all clients' names who purchased PCs, as well as the products' serial number, brand and model
SELECT names as Names, tech.ser_num as Product_Serial, tech.brand as Brand, tech.model as Model
FROM tech, client, payment, included_in
WHERE type_tech = 'PC' and tech.ser_num = included_in.ser_num and
	  included_in.pay_code = payment.code and client.email = payment.client_email