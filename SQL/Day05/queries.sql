-- Day 05: LEFT JOIN

USE data_analytics_practice;


-- Q1. Display all sales with customer information

SELECT
    s.order_id,
    s.customer,
    s.category,
    s.price,
    c.membership
FROM sales AS s
LEFT JOIN customers AS c
    ON s.customer = c.customer;


-- Q2. Find sales where customer information is missing

SELECT
    s.order_id,
    s.customer,
    s.category,
    s.price
FROM sales AS s
LEFT JOIN customers AS c
    ON s.customer = c.customer
WHERE c.customer IS NULL;


-- Q3. Count all sales records

SELECT COUNT(*) AS total_sales
FROM sales;


-- Q4. Count sales with matching customer information

SELECT COUNT(c.customer) AS matched_customers
FROM sales AS s
LEFT JOIN customers AS c
    ON s.customer = c.customer;


-- Q5. Display all sales and membership

SELECT
    s.customer,
    s.category,
    s.quantity,
    s.price,
    c.membership
FROM sales AS s
LEFT JOIN customers AS c
    ON s.customer = c.customer;


-- Q6. Calculate revenue by membership

SELECT
    c.membership,
    SUM(s.quantity * s.price) AS total_revenue
FROM sales AS s
LEFT JOIN customers AS c
    ON s.customer = c.customer
GROUP BY c.membership;


-- Q7. Calculate total quantity by membership

SELECT
    c.membership,
    SUM(s.quantity) AS total_quantity
FROM sales AS s
LEFT JOIN customers AS c
    ON s.customer = c.customer
GROUP BY c.membership;


-- Q8. Find customers missing from the customer table

SELECT DISTINCT
    s.customer
FROM sales AS s
LEFT JOIN customers AS c
    ON s.customer = c.customer
WHERE c.customer IS NULL;


-- Q9. Count unmatched sales

SELECT
    COUNT(*) AS unmatched_sales
FROM sales AS s
LEFT JOIN customers AS c
    ON s.customer = c.customer
WHERE c.customer IS NULL;


-- Q10. Display all sales ordered by price

SELECT
    s.order_id,
    s.customer,
    s.price,
    c.membership
FROM sales AS s
LEFT JOIN customers AS c
    ON s.customer = c.customer
ORDER BY s.price DESC;