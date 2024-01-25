
-- Get the list of customer ids that have rented out movies that cost 7.99 or more 
-- so i can put them in a platinum category and send them coupons later

SELECT DISTINCT customer_id FROM payment WHERE amount >= 7.99;



-- RETURN MOVIE NAME ,RENTAL COST , REPLACEMENT COST OF MOVIE 
-- WITH HIGH VALUE FILMS HAVING RENTAL RATE MORE THAN 2.99 OR REPLACEMENT COST MORE THAN 19.99

SELECT title as "Movie Name" , rental_rate , replacement_cost 
FROM film 
WHERE rental_rate>2.99 OR replacement_cost>19.99;

-- title and other details of movies sorted by highest to lowest of replacement cost 
-- and rented out for 4-6 weeks also only 100 records

SELECT title as "Movie Name" , rental_rate , replacement_cost  , rental_duration
FROM film
WHERE rental_duration BETWEEN 4 AND 6
ORDER BY replacement_cost DESC
LIMIT 100;


-- list all movies that either have the rating 'G' or 'PG' and must be longer than 120 mins and 
-- should have word 'Action' anywhere in the description

SELECT title as "Movie Name",description , rating , length
FROM film
WHERE rating IN ('G','PG') AND length>120 AND description LIKE '%Action%';






