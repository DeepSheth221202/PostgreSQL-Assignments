/* the "actor" table has names of all actors. Can you tell me which actor first names are most common and how many records have it? */

SELECT first_name , COUNT(first_name) 
FROM actor
GROUP BY first_name
ORDER BY COUNT(first_name) DESC;
