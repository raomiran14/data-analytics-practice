-- Day 08: Subqueries


USE data_analytics_practice;


-- Q1. Find products/orders whose price is
-- greater than the average price.

SELECT
    order_id,
    customer,
    price
FROM sales
WHERE price > (
    SELECT AVG(price)
    FROM sales
);


-- Q2. Find the order with the highest price.

SELECT
    order_id,
    customer,
    price
FROM sales
WHERE price = (
    SELECT MAX(price)
    FROM sales
);


-- Q3. Find the order with the lowest price.

SELECT
    order_id,
    customer,
    price
FROM sales
WHERE price = (
    SELECT MIN(price)
    FROM sales
);


-- Q4. Find customers whose age is greater
-- than the average customer age.

SELECT
    customer,
    age
FROM customers
WHERE age > (
    SELECT AVG(age)
    FROM customers
);


-- Q5. Find sales orders having a quantity
-- greater than the average quantity.

SELECT
    order_id,
    customer,
    quantity
FROM sales
WHERE quantity > (
    SELECT AVG(quantity)
    FROM sales
);


-- Q6. Find sales orders whose price is
-- greater than the minimum price.

SELECT
    order_id,
    customer,
    price
FROM sales
WHERE price > (
    SELECT MIN(price)
    FROM sales
);


-- Q7. Find customers whose age is equal to
-- the maximum age.

SELECT
    customer,
    age
FROM customers
WHERE age = (
    SELECT MAX(age)
    FROM customers
);


-- Q8. Find orders having the same price
-- as the most expensive order.

SELECT
    order_id,
    customer,
    price
FROM sales
WHERE price = (
    SELECT MAX(price)
    FROM sales
);


-- Q9. Find all customers older than
-- the average age.

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


-- Q10. Find all orders whose revenue
-- is greater than the average order revenue.

SELECT
    order_id,
    customer,
    quantity,
    price,
    quantity * price AS revenue
FROM sales
WHERE quantity * price > (
    SELECT AVG(quantity * price)
    FROM sales
);