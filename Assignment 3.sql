/*I want something to analyse the pattern between film lang and its rental rate Send me as data extract (report) that shows lang of each movie , 
title , and rental rate*/
  
 SELECT f.title , l.name as "Movie Language" , f.rental_rate
 FROM film f
 JOIN language l
 ON f.language_id = l.language_id;
 
 
 /* Show me a list of actors and the count of movies they have acted in 
 .Sort it in a way that the actor who hase done most movies at top*/
 
 
 SELECT CONCAT(a.first_name , ' ' ,a.last_name) as "actor name" , COUNT(fa.film_id)
 FROM actor a
 JOIN film_actor fa
 ON a.actor_id = fa.actor_id
 GROUP BY a.actor_id
 ORDER BY COUNT(fa.film_id) DESC;
 
 
 /*
 report that shows the diff ratings of 
 all movies and count of movies that have been rented for each rating
 */
 
 
--  select * from film -- film_id , rating
--  select * from rental -- rental_id , inventory_id , customer_id
--  select * from inventory -- inventory_id , film_id
 
 SELECT f.rating , COUNT(i.inventory_id) 
 FROM inventory i
 RIGHT JOIN film f ON f.film_id = i.film_id
 JOIN rental r ON r.inventory_id = i.inventory_id
 GROUP BY f.rating
 ORDER BY COUNT(i.inventory_id) DESC;
 
 
 /*The rental table has fields from rental_date and return date .
 We want to reach out customers whose rental duration eas 7 or more days and 
 send them an email.create the report that list down following cols:
 -Rental date
 -Return date
 -Rent duration
 -Customer First name
 -Customer Last Name
 -Customer Email
 
 */
 
 
 SELECT r.rental_date , r.return_date , AGE(r.return_date , r.rental_date) AS "rental duration" , c.first_name, c.last_name , c.email
 FROM rental r 
 JOIN customer c ON r.customer_id = c.customer_id
 WHERE r.return_date IS NOT NULL AND AGE(r.return_date , r.rental_date) > INTERVAL '7 days'
 ORDER BY "rental duration" DESC;
 
 
 
 /*The Film table has a title field containing name of movies. Some of the 
 movie names are pretty long .Practice SUBSTR function to do following
 */
 
 
 --Return string after 10th character
 SELECT title,SUBSTR(title,10) FROM film;
 --after 15
 SELECT title,LENGTH(title),SUBSTR(title,15) FROM film;
 --after 5 character , just 3 char
 SELECT title,SUBSTR(title,5,3) FROM film;
 
 --after 5 character , just 1 char
 SELECT title,SUBSTR(title,5,1) FROM film;
 
 
 
 