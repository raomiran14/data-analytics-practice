-- Day 08: Customer Subquery Analysis
-- Business-Oriented SQL Practice

USE data_analytics_practice;


-- Q1. Find customers older than the average customer age.

SELECT
    customer,
    age
FROM customers
WHERE age > (
    SELECT AVG(age)
    FROM customers
);


-- Q2. Find Premium customers whose age
-- is greater than the average age of all customers.

SELECT
    customer,
    membership,
    age
FROM customers
WHERE membership = 'Premium'
AND age > (
    SELECT AVG(age)
    FROM customers
);


-- Q3. Find sales made at a price higher
-- than the average sales price.

SELECT
    order_id,
    customer,
    price
FROM sales
WHERE price > (
    SELECT AVG(price)
    FROM sales
)
ORDER BY price DESC;


-- Q4. Find customers who have placed
-- at least one order.

SELECT
    customer
FROM customers
WHERE customer IN (
    SELECT customer
    FROM sales
);


-- Q5. Find customers who have never
-- placed an order.

SELECT
    customer
FROM customers
WHERE customer NOT IN (
    SELECT customer
    FROM sales
);


-- Q6. Find customers whose age is greater
-- than the age of Ahmed.

SELECT
    customer,
    age
FROM customers
WHERE age > (
    SELECT age
    FROM customers
    WHERE customer = 'Ahmed'
);


-- Q7. Find orders made by Premium customers.

SELECT
    order_id,
    customer,
    category,
    quantity,
    price
FROM sales
WHERE customer IN (
    SELECT customer
    FROM customers
    WHERE membership = 'Premium'
);


-- Q8. Find orders made by customers
-- older than 25.

SELECT
    order_id,
    customer,
    price
FROM sales
WHERE customer IN (
    SELECT customer
    FROM customers
    WHERE age > 25
);


-- Q9. Find the customer(s) who made
-- the most expensive order.

SELECT
    customer,
    price
FROM sales
WHERE price = (
    SELECT MAX(price)
    FROM sales
);


-- Q10. Find customers whose age is
-- above the average age and display
-- their membership.

SELECT
    customer,
    membership,
    age
FROM customers
WHERE age > (
    SELECT AVG(age)
    FROM customers
)
ORDER BY age DESC;