USE tech_store
GO

/* Find how many purchases each customer has done and print their names. */
SELECT client.names as Name, Counter.Purchases
FROM client,
(SELECT payment.client_email as Email, COUNT(payment.code) as Purchases
FROM payment
GROUP BY payment.client_email) as Counter
WHERE client.email=Counter.Email

/* Find these clients who have purchased more than one product and print their names, e-mails and for each their number of purchased products. */
SELECT client.email as Email, client.names as Name, SUM(Names.Products) as Products 
FROM(SELECT *
FROM 
(SELECT included_in.pay_code, COUNT(included_in.ser_num) as Products
FROM included_in
GROUP BY included_in.pay_code
HAVING COUNT(included_in.ser_num)>1) as Counter                           
JOIN payment ON payment.code=Counter.pay_code)as Names
JOIN client ON client.email=Names.client_email
GROUP BY client.email, client.names

/* Find how much each client has to pay for all their purchases. */
SELECT Payments.client_email AS Email, SUM(Money.price) AS Money
FROM(SELECT included_in.pay_code, SUM(tech.price) AS price
FROM included_in JOIN tech ON (tech.ser_num=included_in.ser_num)     
GROUP BY pay_code) AS Money
JOIN (SELECT * FROM payment WHERE pay_status = 'ordered') AS Payments ON Payments.code=Money.pay_code
GROUP BY Payments.client_email

/* Find how much it tech products each shop has. Print the address of the shop and the number of products. */
SELECT Numbers.shop_add as Address, COUNT(Numbers.ser_num) as Products
FROM
(SELECT stored_in.shop_add, Products.ser_num
FROM V_join_techittech
as Products
RIGHT JOIN stored_in ON stored_in.ser_num=Products.ser_num)as Numbers
GROUP BY Numbers.shop_add

/*  */
SELECT NewProducts.client_email as Email, SUM(NewProducts.NumberProducts) as Products
FROM 
(SELECT payment.client_email, Numbers.NumberProducts
FROM
(SELECT Products.pay_code, COUNT(Products.ser_num) as NumberProducts         -- Find how much products from it tech each client has purhased.
FROM(SELECT included_in.pay_code, it_tech.ser_num
FROM it_tech
RIGHT JOIN included_in ON included_in.ser_num=it_tech.ser_num)as Products
GROUP BY Products.pay_code) as Numbers
RIGHT JOIN payment ON payment.code=Numbers.pay_code)as NewProducts
GROUP BY NewProducts.client_email

/* Print */