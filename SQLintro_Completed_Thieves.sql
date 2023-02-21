-- SELECT all 
-- FROM actor TABLE
SELECT *
FROM actor;

-- SELECT first_name and last_name 
-- FROM actor TABLE
SELECT first_name, last_name 
FROM actor;

-- Query first_name which equals 'Nick'
-- Using WHERE clause
SELECT first_name
FROM actor
WHERE first_name = 'Nick';

-- Query first_name which equals 'Nick'
-- Using LIKE clause
-- NOTE: ( = ) is looking for the literal string
-- while the LIKE clause allows for use with Wild Cards
SELECT first_name
FROM actor
WHERE first_name LIKE 'Nick';

-- Using LIKE clause and WILD CARD ( % )
-- Get all J names
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'Ja%';

-- Single character WILD CARD ( _ )
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K___';

-- Query for all first_names that start with 'K__%' has two letters then anything goes
SELECT first_name
FROM actor
WHERE first_name LIKE 'K__%';

----- Comparison Operators:
-- = Equal To
-- > Greater Than
-- < Less Than
-- >= Greater Than or Equal To
-- <= Less Than or Equal To
-- <> Not Equals

SELECT *
FROM payment;

-- Query WHERE amount GREATER THAN $10
SELECT customer_id, amount
FROM payment
WHERE amount > 10;

-- Query amounts BETWEEN $10-$15
-- NOTE: When using BETWEEN both values are inclusive
SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 10 AND 15;

-- Order the payments by amount
-- Using ORDER BY
-- ASC for ascending ( Default )
-- DESC for descending
SELECT customer_id, amount
FROM payment
ORDER BY amount DESC;

-- Order the payments by date
SELECT customer_id, amount, payment_date
FROM payment
ORDER BY payment_date DESC;

-- Query all payments NOT EQUAL to 2.99
SELECT customer_id, amount
FROM payment
WHERE amount <> 2.99
ORDER BY amount;

----- Aggregate Functions
-- MIN()
-- MAX()
-- COUNT()
-- AVG()
-- SUM()

-- Query the SUM of amounts GREATER THAN OR EQUAL TO 5.99
SELECT SUM(amount)
FROM payment
WHERE amount >= 5.99;

-- Query the AVG of amounts GREATER THAN OR EQUAL TO 5.99
SELECT AVG(amount)
FROM payment
WHERE amount >= 5.99;

-- Query the COUNT of amounts GREATER THAN OR EQUAL TO 5.99
SELECT COUNT(amount)
FROM payment
WHERE amount >= 5.99;

-- Query to display the count of DISTINCT amounts paid greater than or equal to 5.99
SELECT COUNT(DISTINCT amount)
FROM payment
WHERE amount >= 5.99;

-- Query to display the MIN paid using alias
SELECT MIN(amount) AS min_amount_paid
FROM payment;

-- Query to display the MAX paid using alias
SELECT MAX(amount) as max_amount_paid
FROM payment;

-- GROUP BY (Used with aggregate functions)
SELECT customer_id, COUNT(amount)
FROM payment
GROUP BY customer_id;

-- Query the customer that paid the most
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 10;

-- Add more specificity to the aggregated result with HAVING keyword
-- WHERE keyword cannot be used with aggregates, but the HAVING keyword can.
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) < 500
ORDER BY SUM(amount) DESC;