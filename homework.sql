-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT first_name, last_name
FROM actor
WHERE last_name = 'Wahlberg';
-- 2 instances


-- 2. How many payments were made between $3.99 and $5.99?
SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 and 5.99;
-- Answer: 4794 instances


-- 3. What film does the store have the most of? (search in inventory table)
SELECT *
FROM inventory;
-- shows all the films in each store
--- parameters we need are film_id, inventory_id, and store_id?
--- inventory_id looks unique, film_id looks like it has duplicates
SELECT store_id, COUNT(film_id)
FROM inventory
GROUP BY store_id
ORDER BY COUNT(film_id) DESC;
---Shows the number of films in each store in descending - close but we need to count # of distinct films
SELECT store_id, COUNT(DISTINCT film_id)
FROM inventory
GROUP BY store_id
ORDER BY COUNT(DISTINCT film_id) DESC; 
--- shows number of distinct films in each store, try counting inventory_id 
SELECT film_id, COUNT(inventory_id)
FROM inventory
GROUP BY film_id
ORDER BY COUNT(inventory_id) DESC;
--- shows a bunch of films with 8 copies in the store, so we should just filter to the ones that have 8?
SELECT film_id, COUNT(inventory_id)
FROM inventory
GROUP BY film_id
HAVING COUNT(inventory_id) > 7;

---Answer: There are a bunch of movies with 8 copies, which is the most of any film. 


-- 4. How many customers have the last name ‘William’?
SELECT first_name, last_name
FROM customer
WHERE last_name = 'William';

-- SELECT first_name, last_name
-- FROM customer
-- WHERE last_name like 'William%';
--- we don't have anyonee with the last name 'William', but we have one with 'Williams' and one with 'Williamson'


-- 5. What store employee (get the id) sold the most rentals?
-- SELECT *
-- FROM rental;
--- parameters we need are rental_id, staff_id, inventory_id
--- don't actually need rental_id because we're not figuring out which rental was sold the most

SELECT staff_id, SUM(inventory_id)
FROM rental
GROUP BY staff_id
ORDER BY SUM(inventory_id) DESC;
--- Employee #1 

-- 6. How many different distinct names are there?
SELECT COUNT(DISTINCT first_name)
FROM staff;
--- Staff table has 2 distinct names

SELECT COUNT(DISTINCT first_name)
FROM customer;
--- Customer table has 591 distinct first names (599 distinct last names)


-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC
LIMIT 10;
--- Answer: Film id 508 had the most actors (15 actors)


-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT (*)
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es';
--- Answer: 13

-- SELECT *
-- FROM customer
-- WHERE store_id = 1 AND last_name LIKE '%es';
--- Just to confirm and see the list of names


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
-- SELECT *
-- FROM payment;
--- parameters that we need are amounts, customer_id, rental_id, 
SELECT customer_id, amount, COUNT(rental_id)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount, customer_id;
--- shows list of customer_id with the amounts they've paid and the # of movies they've paid for each amount

SELECT customer_id, amount, COUNT(rental_id) AS rental_count
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount, customer_id
HAVING COUNT(rental_id) > 250;
--- Answer: No payment ids had rentals numbers above 250 for customers between 380-430

SELECT COUNT(amount), amount
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(amount) > 250;
--- Answer: 3 payment amounts have num of rentals above 250 for customers between 380 and 430

-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
SELECT rating, COUNT(DISTINCT film_id)
FROM film
GROUP BY rating
ORDER BY COUNT(DISTINCT film_id) DESC;
--- There are 5 distinct rating categories, and the PG-13 category has the most movies.
