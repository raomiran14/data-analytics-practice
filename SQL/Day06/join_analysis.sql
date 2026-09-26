
-- RIGHT JOIN Exercises

USE data_analytics_practice;


-- Q1. Display every customer and their total number of orders.

SELECT
    c.customer,
    COUNT(s.order_id) AS total_orders
FROM sales AS s
RIGHT JOIN customers AS c
    ON s.customer = c.customer
GROUP BY c.customer;


-- Q2. Find customers who have zero orders.

SELECT
    c.customer
FROM sales AS s
RIGHT JOIN customers AS c
    ON s.customer = c.customer
WHERE s.order_id IS NULL;


-- Q3. Display each customer's total quantity purchased.

SELECT
    c.customer,
    COALESCE(SUM(s.quantity), 0) AS total_quantity
FROM sales AS s
RIGHT JOIN customers AS c
    ON s.customer = c.customer
GROUP BY c.customer;


-- Q4. Display each customer's total revenue.

SELECT
    c.customer,
    COALESCE(SUM(s.quantity * s.price), 0) AS total_revenue
FROM sales AS s
RIGHT JOIN customers AS c
    ON s.customer = c.customer
GROUP BY c.customer;


-- Q5. Find customers with total quantity greater than 2.

SELECT
    c.customer,
    SUM(s.quantity) AS total_quantity
FROM sales AS s
RIGHT JOIN customers AS c
    ON s.customer = c.customer
GROUP BY c.customer
HAVING SUM(s.quantity) > 2;


-- Q6. Find Premium customers with total revenue greater than 1000.

SELECT
    c.customer,
    c.membership,
    SUM(s.quantity * s.price) AS total_revenue
FROM sales AS s
RIGHT JOIN customers AS c
    ON s.customer = c.customer
WHERE c.membership = 'Premium'
GROUP BY c.customer, c.membership
HAVING SUM(s.quantity * s.price) > 1000;


-- Q7. Display customers with their highest order price.

SELECT
    c.customer,
    MAX(s.price) AS highest_order_price
FROM sales AS s
RIGHT JOIN customers AS c
    ON s.customer = c.customer
GROUP BY c.customer;


-- Q8. Display customers with their lowest order price.

SELECT
    c.customer,
    MIN(s.price) AS lowest_order_price
FROM sales AS s
RIGHT JOIN customers AS c
    ON s.customer = c.customer
GROUP BY c.customer;


-- Q9. Display customers and their average order price,
-- sorted from highest to lowest.

SELECT
    c.customer,
    ROUND(AVG(s.price), 2) AS average_price
FROM sales AS s
RIGHT JOIN customers AS c
    ON s.customer = c.customer
GROUP BY c.customer
ORDER BY average_price DESC;


-- Q10. Find customers whose total revenue is between 1000 and 3000.

SELECT
    c.customer,
    SUM(s.quantity * s.price) AS total_revenue
FROM sales AS s
RIGHT JOIN customers AS c
    ON s.customer = c.customer
GROUP BY c.customer
HAVING SUM(s.quantity * s.price) BETWEEN 1000 AND 3000;