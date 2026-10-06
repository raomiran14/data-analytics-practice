-- Day 11: RANK() and DENSE_RANK()
-- SQL Data Analytics Practice

USE data_analytics_practice;


-- Q1. Rank all orders by price from highest to lowest.

SELECT
    order_id,
    customer,
    price,
    RANK() OVER (
        ORDER BY price DESC
    ) AS price_rank
FROM sales;


-- Q2. Dense rank all orders by price.

SELECT
    order_id,
    customer,
    price,
    DENSE_RANK() OVER (
        ORDER BY price DESC
    ) AS price_rank
FROM sales;


-- Q3. Rank orders separately within each category.

SELECT
    order_id,
    customer,
    category,
    price,
    RANK() OVER (
        PARTITION BY category
        ORDER BY price DESC
    ) AS category_rank
FROM sales;


-- Q4. Dense rank orders separately within each category.

SELECT
    order_id,
    customer,
    category,
    price,
    DENSE_RANK() OVER (
        PARTITION BY category
        ORDER BY price DESC
    ) AS category_rank
FROM sales;


-- Q5. Rank orders by revenue.

SELECT
    order_id,
    customer,
    quantity * price AS revenue,
    RANK() OVER (
        ORDER BY quantity * price DESC
    ) AS revenue_rank
FROM sales;


-- Q6. Rank orders separately within each region.

SELECT
    order_id,
    customer,
    region,
    price,
    RANK() OVER (
        PARTITION BY region
        ORDER BY price DESC
    ) AS region_rank
FROM sales;


-- Q7. Dense rank customers by age.

SELECT
    customer,
    age,
    DENSE_RANK() OVER (
        ORDER BY age DESC
    ) AS age_rank
FROM customers;


-- Q8. Rank customers separately by membership.

SELECT
    customer,
    membership,
    age,
    RANK() OVER (
        PARTITION BY membership
        ORDER BY age DESC
    ) AS age_rank
FROM customers;


-- Q9. Rank orders by quantity.

SELECT
    order_id,
    customer,
    quantity,
    RANK() OVER (
        ORDER BY quantity DESC
    ) AS quantity_rank
FROM sales;


-- Q10. Dense rank orders by quantity within each category.

SELECT
    order_id,
    customer,
    category,
    quantity,
    DENSE_RANK() OVER (
        PARTITION BY category
        ORDER BY quantity DESC
    ) AS quantity_rank
FROM sales;