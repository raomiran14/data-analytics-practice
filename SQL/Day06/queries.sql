-- Day 06: RIGHT JOIN
-- SQL Data Analytics Practice

USE data_analytics_practice;


-- Q1. Display all customers and their orders

SELECT
    c.customer,
    c.membership,
    s.order_id,
    s.category,
    s.price
FROM sales AS s
RIGHT JOIN customers AS c
    ON s.customer = c.customer;


-- Q2. Display all customers with their membership and order price

SELECT
    c.customer,
    c.membership,
    c.age,
    s.price
FROM sales AS s
RIGHT JOIN customers AS c
    ON s.customer = c.customer;


-- Q3. Find customers who have no orders

SELECT
    c.customer,
    c.membership
FROM sales AS s
RIGHT JOIN customers AS c
    ON s.customer = c.customer
WHERE s.order_id IS NULL;


-- Q4. Count orders for each customer

SELECT
    c.customer,
    COUNT(s.order_id) AS total_orders
FROM sales AS s
RIGHT JOIN customers AS c
    ON s.customer = c.customer
GROUP BY c.customer;


-- Q5. Calculate total quantity purchased by each customer

SELECT
    c.customer,
    COALESCE(SUM(s.quantity), 0) AS total_quantity
FROM sales AS s
RIGHT JOIN customers AS c
    ON s.customer = c.customer
GROUP BY c.customer;


-- Q6. Calculate total revenue for each customer

SELECT
    c.customer,
    COALESCE(SUM(s.quantity * s.price), 0) AS total_revenue
FROM sales AS s
RIGHT JOIN customers AS c
    ON s.customer = c.customer
GROUP BY c.customer;


-- Q7. Find Premium customers and their orders

SELECT
    c.customer,
    c.membership,
    s.order_id,
    s.price
FROM sales AS s
RIGHT JOIN customers AS c
    ON s.customer = c.customer
WHERE c.membership = 'Premium';


-- Q8. Find customers whose total revenue is greater than 1500

SELECT
    c.customer,
    SUM(s.quantity * s.price) AS total_revenue
FROM sales AS s
RIGHT JOIN customers AS c
    ON s.customer = c.customer
GROUP BY c.customer
HAVING SUM(s.quantity * s.price) > 1500;


-- Q9. Display customers ordered by total revenue

SELECT
    c.customer,
    COALESCE(SUM(s.quantity * s.price), 0) AS total_revenue
FROM sales AS s
RIGHT JOIN customers AS c
    ON s.customer = c.customer
GROUP BY c.customer
ORDER BY total_revenue DESC;


-- Q10. Find customers who have an average order price
-- greater than 800

SELECT
    c.customer,
    ROUND(AVG(s.price), 2) AS average_price
FROM sales AS s
RIGHT JOIN customers AS c
    ON s.customer = c.customer
GROUP BY c.customer
HAVING AVG(s.price) > 800;