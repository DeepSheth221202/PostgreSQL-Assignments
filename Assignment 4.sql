/*
 create report that shows following cols:-
 CustomerName , Email , Total Rental , 
 Customer Category Based on ELITE - total rentals > 200, 
 Platinum >150
 Gold > 100
 Silver > 0
*/

SELECT CONCAT(c.first_name ,' ',c.last_name) as "Customer Name", c.email,
	SUM(amount) , 
	CASE 
		WHEN SUM(amount) > 200 THEN 'Elite'
		WHEN SUM(amount) > 150 THEN 'Platinum'
		WHEN SUM(amount) > 100 THEN 'Gold'
		WHEN SUM(amount) > 0 THEN 'Silver'
		
	END AS "Catgory"
FROM customer c
LEFT JOIN payment p ON c.customer_id =p.customer_id
GROUP BY c.customer_id;   


--Create view of prev query

CREATE VIEW cutomer_segments AS
	SELECT CONCAT(c.first_name ,' ',c.last_name) as "Customer Name", c.email,
	SUM(amount) , 
		CASE 
			WHEN SUM(amount) > 200 THEN 'Elite'
			WHEN SUM(amount) > 150 THEN 'Platinum'
			WHEN SUM(amount) > 100 THEN 'Gold'
			WHEN SUM(amount) > 0 THEN 'Silver'

		END AS "Catgory"
	FROM customer c
	LEFT JOIN payment p ON c.customer_id =p.customer_id
	GROUP BY c.customer_id;


-- PRIMARY KEY => UNIQUE + NOT NULL
-- FORIEGN KEY => REFERNCE TO SOME OTHER TABLE'S PRIMARY KEY , WE CAN HAVE MULTIPLE FORIEGN KEY IN ONE TABLE

CREATE DATABASE DB_NAME ;
DROP DATABASE IF EXISTS DB_NAME;

--SERIAL => AUTO INCREAMENT

DELETE FROM TB_NAME WHERE [] --> IF NO CONDITION PROVIDED ALL ROWS WILL BE DELETED ! carefull!!!

DROP TABLE TB_NAME CASCADE; --> THIS WILL DELETE THE TABLE ALONG WITH THE OBJECTS THAT ARE RELATED TO THAT TABLE


CREATE DATABASE mycommerce;

CREATE TABLE order_details 
(
	order_id INT PRIMARY KEY,
	customer_name VARCHAR(50) NOT NULL,
	product_name VARCHAR(50) NOT NULL,
	ordered_from VARCHAR(50) NOT NULL,
	order_amount NUMERIC(10,2),
	order_date DATE NOT NULL,
	delivery_date DATE
);

SELECT product_name , COUNT(order_id) AS "no. of orders",
SUM(order_amount) as "Total Sales"
FROM order_details
GROUP BY product_name;

ALTER TABLE order_details
RENAME COLUMN "customer_name" TO "customer_first_name"

ALTER TABLE order_details
ADD COLUMN "cancel_date" DATE NOT NULL;



select * from order_details;


