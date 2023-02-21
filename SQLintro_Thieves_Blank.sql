-- Verify connection to DB using the Actor Table
SELECT *
FROM actor;
-- SELECT first_name and last_name
-- FROM actor TABLE
SELECT first_name, last_name
FROM actor;

-- Query first_name which equals 'Nick'
-- Using the WHERE Clause
SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';

-- Query first_name which equals 'Nick'
-- Using LIKE clause
-- NOTE: ( = ) is looking for a literal string
-- while the LIKE Clause allows use for wildcards
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'Nick';

-- Using LIKE Clause and WILD CARD ( % )
-- Get all J names
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J%';
--look at bottom right of opened window and you can see how many entries 

-- Single Character Wild Card ( _ )
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K__';

-- Query for all first_names that start with 'K__%' has two letters, anything goes after
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K__%';
-- this means we're finding any names that being with K and have at least 3 letters

----- Comparasion Operators:
-- = Equals to
-- > Greater Than
-- < Less Than
-- >= Greater Than or Equal to
-- <= Less Than or Equal to
-- <> Not equals

-- Using Comparasion Operators with the Payment Table
SELECT *
FROM payment;

-- Query WHERE amount GREATER THAN $10.
SELECT amount
FROM payment
WHERE amount > 10;

-- Query amounts BETWEEN $10-$15
SELECT amount
FROM payment
WHERE amount BETWEEN 10 AND 15;
-- NOTE: When using BETWEEN both values are inclusive


-- Order the payments by amount
-- Using the ORDER BY
-- ASC for ascending order (Default)
-- DESC for decending order
SELECT amount
FROM payment
ORDER BY amount DESC;

-- Query all payments NOT EQUAL to 2.99
SELECT amount
FROM payment
WHERE amount <> 2.99;

----- Aggregate Functions
-- MIN()
-- MAX()
-- SUM()
-- AVG()
-- COUNT()

-- Query the SUM of amounts GREATER THAN OR EQUAL TO 5.99
SELECT SUM(amount)
FROM payment
WHERE amount >= 5.99;
-- Includes all amounts that are greater than 5.99 in sum

-- Query the AVG of amounts GREATER THAN OR EQUAL TO 5.99
SELECT AVG(amount)
FROM payment
WHERE amount >= 5.99;

-- Query the COUNT of amounts GREATER THAN OR EQUAL TO 5.99
SELECT COUNT(amount)
FROM payment
WHERE amount >= 5.99;

-- Query to display the count of DISTINCT amounts paid
SELECT COUNT(DISTINCT amount)
FROM payment;
-- will count unique values in amount column
-- vs
SELECT COUNT(amount)
FROM payment;
-- will count all payment amounts regardless if they are duplicates

-- Query to display the MIN paid using alias
SELECT MIN(amount) AS min_amount_paid
FROM payment;
-- doing the "AS ..."" will change the column title

-- Query to display the MAX paid using alias
SELECT MAX(amount) AS max_amount_paid
FROM payment;

-- GROUP BY (Used with aggregate functions)
SELECT customer_id, COUNT(amount)
FROM payment
GROUP BY customer_id
ORDER BY customer_id;

-- Query the customer that paid the most
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 10;

-- WHERE keyword cannot be used with aggregates, HAVING can
---This doesn't work, where cannot be after GROUP BY
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
WHERE SUM(amount) > 300;

---This works, HAVING is used in place of WHERE
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 300;

----hint: can do hw without where or having