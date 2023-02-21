1. What is a database?
-- Collection of data

2. What is SQL? (Structured Query Language)
-- Standard language for storing, manipulating and retrieving data in databases.

3. RDBMS (Relational Database Management System)
-- We use a RDBMS to show data from our database.
Ex: (PostgreSQL, MySQL, SQLite, Many Others)

--------- SQL Keywords ----------
SELECT - Selects data from a database
SELECT DISTINCT - return only distinct (different) values
FROM - Specifies which table to select or delete data from
WHERE - Filters a result set to include only records that fulfill a specified condition
LIKE - Searches for a specified pattern in a column
BETWEEN - Selects values within a given range
AND - Only includes rows where both conditions is true
ORDER BY - Sorts the result set in ascending or descending order
ASC - Sorts the result set in ascending order
DESC - Sorts the result set in descending order
AS - Renames a column or table with an alias
GROUP BY - Groups the result set (used with aggregate functions: COUNT, MAX, MIN, SUM, AVG)
LIMIT - Specifies the number of records to return in the result set

--------- SQL Wildcards ----------
% - Represents zero or more characters
_ - Represents a single character

--------- SQL Aggregation Functions ----------
MIN() - returns the smallest value of the selected column
MAX() - returns the largest value of the selected column
COUNT() - returns the number of rows that matches a specified criterion
AVG() - returns the average value of a numeric column
SUM() - returns the total sum of a numeric column