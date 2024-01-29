SELECT first_name , COUNT(first_name) 
FROM actor
GROUP BY first_name
ORDER BY COUNT(first_name) DESC;
