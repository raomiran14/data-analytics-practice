-- Day 09: Correlated Subqueries
-- SQL Data Analytics Practice

USE data_analytics_practice;


-- Q1. Find customers who are older than
-- the average age of customers.

SELECT
    c.customer,
    c.age
FROM customers AS c
WHERE c.age > (
    SELECT AVG(c2.age)
    FROM customers AS c2
);


-- Q2. Find customers whose age is greater
-- than the average age of customers
-- with the same membership.

SELECT
    c.customer,
    c.membership,
    c.age
FROM customers AS c
WHERE c.age > (
    SELECT AVG(c2.age)
    FROM customers AS c2
    WHERE c2.membership = c.membership
);


-- Q3. Find sales orders whose price is greater
-- than the average price of the same category.

SELECT
    s.order_id,
    s.customer,
    s.category,
    s.price
FROM sales AS s
WHERE s.price > (
    SELECT AVG(s2.price)
    FROM sales AS s2
    WHERE s2.category = s.category
);


-- Q4. Find sales orders whose quantity is greater
-- than the average quantity of the same category.

SELECT
    s.order_id,
    s.customer,
    s.category,
    s.quantity
FROM sales AS s
WHERE s.quantity > (
    SELECT AVG(s2.quantity)
    FROM sales AS s2
    WHERE s2.category = s.category
);


-- Q5. Find customers whose age is greater
-- than the average age of their membership group.

SELECT
    c.customer,
    c.membership,
    c.age
FROM customers AS c
WHERE c.age > (
    SELECT AVG(c2.age)
    FROM customers AS c2
    WHERE c2.membership = c.membership
)
ORDER BY c.membership, c.age DESC;


-- Q6. Find orders whose price is greater
-- than the average price of their region.

SELECT
    s.order_id,
    s.customer,
    s.region,
    s.price
FROM sales AS s
WHERE s.price > (
    SELECT AVG(s2.price)
    FROM sales AS s2
    WHERE s2.region = s.region
);


-- Q7. Find customers whose age is greater
-- than the average age of customers
-- in the same membership type.

SELECT
    c.customer,
    c.membership,
    c.age
FROM customers AS c
WHERE c.age > (
    SELECT AVG(c2.age)
    FROM customers AS c2
    WHERE c2.membership = c.membership
);


-- Q8. Find orders whose revenue is greater
-- than the average revenue of their category.

SELECT
    s.order_id,
    s.customer,
    s.category,
    s.quantity * s.price AS revenue
FROM sales AS s
WHERE s.quantity * s.price > (
    SELECT AVG(s2.quantity * s2.price)
    FROM sales AS s2
    WHERE s2.category = s.category
);


-- Q9. Find customers who are older than
-- the average age of their membership
-- and display their age.

SELECT
    c.customer,
    c.membership,
    c.age
FROM customers AS c
WHERE c.age > (
    SELECT AVG(c2.age)
    FROM customers AS c2
    WHERE c2.membership = c.membership
);


-- Q10. Find orders whose price is greater
-- than the average price of their category
-- and region.

SELECT
    s.order_id,
    s.customer,
    s.category,
    s.region,
    s.price
FROM sales AS s
WHERE s.price > (
    SELECT AVG(s2.price)
    FROM sales AS s2
    WHERE s2.category = s.category
      AND s2.region = s.region
);