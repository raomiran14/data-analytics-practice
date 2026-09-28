-- Day 07: UNION and UNION ALL
-- SQL Data Analytics Practice

USE data_analytics_practice;


-- Q1. Display all customer names from the customers table
-- and sales table without duplicates.

SELECT customer
FROM customers

UNION

SELECT customer
FROM sales;


-- Q2. Display all customer names from the customers table
-- and sales table including duplicates.

SELECT customer
FROM customers

UNION ALL

SELECT customer
FROM sales;


-- Q3. Display all unique regions from the sales table
-- and a manually created business region list.

SELECT region
FROM sales

UNION

SELECT 'Rawalpindi' AS region;


-- Q4. Display all regions including duplicates.

SELECT region
FROM sales

UNION ALL

SELECT 'Karachi' AS region;


-- Q5. Display customer names from both tables
-- and sort the final result alphabetically.

SELECT customer
FROM customers

UNION

SELECT customer
FROM sales

ORDER BY customer;


-- Q6. Display Premium customers and customers
-- who have made purchases.

SELECT customer
FROM customers
WHERE membership = 'Premium'

UNION

SELECT customer
FROM sales;


-- Q7. Display Premium customers and customers
-- who have made purchases, keeping duplicates.

SELECT customer
FROM customers
WHERE membership = 'Premium'

UNION ALL

SELECT customer
FROM sales;


-- Q8. Display all unique categories and membership types
-- in one result.

SELECT category AS type
FROM sales

UNION

SELECT membership AS type
FROM customers;


-- Q9. Display all unique names appearing
-- in either customers or sales.

SELECT customer AS name
FROM customers

UNION

SELECT customer AS name
FROM sales;


-- Q10. Count the number of unique customers
-- appearing in either table.

SELECT COUNT(*) AS unique_customers
FROM
(
    SELECT customer
    FROM customers

    UNION

    SELECT customer
    FROM sales
) AS all_customers;