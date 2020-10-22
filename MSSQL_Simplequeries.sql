USE tech_store
GO

--List all tech products with price above 1000 and print their brand, model and price
SELECT tech.brand as Brand, tech.model as Model, tech.price as Price
FROM tech
WHERE tech.price > 1000

--List all shops that have address starting with "V", print all attributes
SELECT *
FROM shop
WHERE shop_add like 'V%'

--List all payments with status "payed", print all attributes
SELECT code, client_email, pay_status
FROM payment
WHERE pay_status = 'paid'

--List all clients that have an email at abv.bg, print all attributes
SELECT *
FROM client
WHERE email like '%abv.bg'

--List all clients that have an email at gmail.com and a phone with first three digits "088"
SELECT *
FROM client
WHERE email like '%gmail.com' and phone like '088%'