--Day 07: Customer Sales Analysis
 Business-Oriented SQL Practice

USE data_analytics_practice;


 Q1. Find all unique customers who either
 exist in the customer database or have placed an order.

SELECT customer
FROM customers

UNION

SELECT customer
FROM sales;


--Q2. Find customers who have purchased something
-- or are Premium members.

SELECT customer
FROM sales

UNION

SELECT customer
FROM customers
WHERE membership = 'Premium';


-- Q3. Find all unique customer names
-- and sort them alphabetically.

SELECT customer
FROM customers

UNION

SELECT customer
FROM sales

ORDER BY customer;


-- Q4. Count all unique customers
-- across both tables.

SELECT COUNT(*) AS total_unique_customers
FROM
(
    SELECT customer
    FROM customers

    UNION

    SELECT customer
    FROM sales
) AS customers_list;


-- Q5. Find customers who are present in the
-- customers table or sales table.

SELECT customer
FROM customers

UNION

SELECT customer
FROM sales;


-- Q6. Find all unique categories and regions
-- from the sales data.

SELECT category AS information
FROM sales

UNION

SELECT region AS information
FROM sales;


-- Q7. Find all unique membership types and
-- product categories.

SELECT membership AS type
FROM customers

UNION

SELECT category AS type
FROM sales;


-- Q8. Count how many different categories
-- and regions exist in the sales table.

SELECT COUNT(*) AS total_unique_values
FROM
(
    SELECT category AS value
    FROM sales

    UNION

    SELECT region AS value
    FROM sales
) AS unique_values;


-- Q9. Display customers from both tables
-- without duplicates and assign a label.

SELECT customer, 'Customer Table' AS source
FROM customers

UNION

SELECT customer, 'Sales Table' AS source
FROM sales;


-- Q10. Display every customer appearing in either
-- table and identify where they came from.

SELECT customer, 'Customer Table' AS source
FROM customers

UNION ALL

SELECT customer, 'Sales Table' AS source
FROM sales;