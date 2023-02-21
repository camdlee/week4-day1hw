-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT first_name, last_name
FROM actor
WHERE last_name = 'Wahlberg';
-- 2 instances

-- 2. How many payments were made between $3.99 and $5.99?
SELECT amount
FROM payment
WHERE amount BETWEEN 3.99 and 5.99;
-- 4794 instances

-- 3. What film does the store have the most of? (search in inventory table)
SELECT store_id, film_id
FROM inventory
ORDER BY inventory_id DESC;
--- film_id 1000 

-- 4. How many customers have the last name ‘William’?
SELECT first_name, last_name
FROM customer
WHERE last_name = 'William';

-- SELECT first_name, last_name
-- FROM customer
-- WHERE last_name like 'William%';
--- we don't have anyonee with the last name 'William', but we have one with 'Williams' and one with 'Williamson'


-- 5. What store employee (get the id) sold the most rentals?
SELECT staff_id, SUM(inventory_id)
FROM rental
GROUP BY staff_id
ORDER BY SUM(inventory_id) DESC;
--- Employee #1 

-- 6. How many different distinct names are there?
SELECT first_name, last_name
FROM customer
ORDER BY first_name;
---!!!!
--- Staff table has 2 distinct names
--- Customer table has 599 names

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC
LIMIT 10;
--- Film id 508 had the most actors (15 actors)

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT store_id, last_name
FROM customer
WHERE last_name LIKE '%es'
GROUP BY customer_id 
ORDER BY store_id;
---!!!!!

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
SELECT customer_id, COUNT(rental_id)
FROM payment
GROUP BY customer_id BETWEEN 380 AND 430
HAVING COUNT(rental_id) > 250;
---!!!!!

-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
SELECT rating, COUNT(DISTINCT film_id)
FROM film
GROUP BY rating
ORDER BY COUNT(DISTINCT film_id) DESC;
--- There are 5 distinct rating categories, and the PG-13 category has the most movies.
