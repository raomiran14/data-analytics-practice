-- Day 04: INNER JOIN

USE data_analytics_practice;


-- Create the customers table

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer VARCHAR(50),
    membership VARCHAR(20),
    age INT
);


-- Insert customer data

INSERT INTO customers
(customer_id, customer, membership, age)
VALUES
(1, 'Ali', 'Premium', 24),
(2, 'Ahmed', 'Regular', 27),
(3, 'Sara', 'Premium', 23),
(4, 'Hassan', 'Regular', 30),
(5, 'Ayesha', 'Premium', 26),
(6, 'Usman', 'Regular', 28),
(7, 'Fatima', 'Premium', 22),
(8, 'Bilal', 'Regular', 31),
(9, 'Zainab', 'Premium', 25),
(10, 'Omar', 'Regular', 29);


-- Q1. Display sales information with customer membership

SELECT
    s.order_id,
    s.customer,
    s.category,
    s.quantity,
    s.price,
    c.membership
FROM sales AS s
INNER JOIN customers AS c
    ON s.customer = c.customer;


-- Q2. Display customer name, age, and order price

SELECT
    s.customer,
    c.age,
    s.price
FROM sales AS s
INNER JOIN customers AS c
    ON s.customer = c.customer;


-- Q3. Display Premium customers' orders

SELECT
    s.order_id,
    s.customer,
    s.category,
    s.price,
    c.membership
FROM sales AS s
INNER JOIN customers AS c
    ON s.customer = c.customer
WHERE c.membership = 'Premium';


-- Q4. Calculate total revenue by membership type

SELECT
    c.membership,
    SUM(s.quantity * s.price) AS total_revenue
FROM sales AS s
INNER JOIN customers AS c
    ON s.customer = c.customer
GROUP BY c.membership;


-- Q5. Count orders by membership type

SELECT
    c.membership,
    COUNT(*) AS total_orders
FROM sales AS s
INNER JOIN customers AS c
    ON s.customer = c.customer
GROUP BY c.membership;


-- Q6. Calculate average price by membership type

SELECT
    c.membership,
    ROUND(AVG(s.price), 2) AS average_price
FROM sales AS s
INNER JOIN customers AS c
    ON s.customer = c.customer
GROUP BY c.membership;


-- Q7. Find Premium orders where price is greater than 800

SELECT
    s.customer,
    s.category,
    s.price,
    c.membership
FROM sales AS s
INNER JOIN customers AS c
    ON s.customer = c.customer
WHERE c.membership = 'Premium'
  AND s.price > 800;


-- Q8. Calculate total quantity by membership type

SELECT
    c.membership,
    SUM(s.quantity) AS total_quantity
FROM sales AS s
INNER JOIN customers AS c
    ON s.customer = c.customer
GROUP BY c.membership;


-- Q9. Display customer details sorted by price

SELECT
    s.customer,
    c.age,
    c.membership,
    s.category,
    s.price
FROM sales AS s
INNER JOIN customers AS c
    ON s.customer = c.customer
ORDER BY s.price DESC;


-- Q10. Display membership-wise revenue from highest to lowest

SELECT
    c.membership,
    SUM(s.quantity * s.price) AS total_revenue
FROM sales AS s
INNER JOIN customers AS c
    ON s.customer = c.customer
GROUP BY c.membership
ORDER BY total_revenue DESC;