--CASE

SELECT amount , 
CASE
	WHEN amount < 2 THEN 'LOW'
	WHEN amount < 5  AND amount >2 THEN 'MID'
	WHEN amount > 5 THEN 'HIGH'
END
FROM payment



--COALESCE -> to replace null with some specific value
SELECT * FROM address WHERE address2 IS NULL

SELECT address_id , address , address2 , 
COALESCE(address2 , 'house')
FROM address;


--NULLIF -> takes two arguments if they are same then it will return null else it will return first arg
SELECT NULLIF(10,10); --> NULL
SELECT NULLIF(10,154); -->10

SELECT amount as "USD" , 10/amount FROM payment; --> this will throw error bcz there are some amount which are 0;

SELECT amount as "USD" , 10/NULLIF(amount,0) FROM payment;  -->this will replace 0 amount with null so that 10/null will give null and it wont throw error

SELECT amount as "USD" , COALESCE(10/NULLIF(amount,0) , 0) FROM payment; --> to replace NULL with 0
 
 
--VIEW --> Virtual table

CREATE VIEW film_view AS 
SELECT * FROM film LIMIT 10; --you can write as complex query you want

SELECT * FROM film_view WHERE film_id =2; 
/*in reality view doesnt take any storage it is more like virtual table we can add rows or fetch from them put 
where conditions  */

DROP VIEW film_view;




