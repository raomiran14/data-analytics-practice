-- Day 10: Top-N Analysis
-- Business-Oriented SQL Practice

USE data_analytics_practice;


-- Q1. Find the top 3 highest-priced orders.

SELECT *
FROM (
    SELECT
        order_id,
        customer,
        category,
        price,
        ROW_NUMBER() OVER (
            ORDER BY price DESC
        ) AS row_num
    FROM sales
) AS ranked_sales
WHERE row_num <= 3;


-- Q2. Find the top 2 customers by age
-- from each membership type.

SELECT *
FROM (
    SELECT
        customer,
        membership,
        age,
        ROW_NUMBER() OVER (
            PARTITION BY membership
            ORDER BY age DESC
        ) AS row_num
    FROM customers
) AS ranked_customers
WHERE row_num <= 2;


-- Q3. Find the most expensive order
-- in each region.

SELECT *
FROM (
    SELECT
        order_id,
        customer,
        region,
        price,
        ROW_NUMBER() OVER (
            PARTITION BY region
            ORDER BY price DESC
        ) AS row_num
    FROM sales
) AS ranked_sales
WHERE row_num = 1;


-- Q4. Find the top 2 most expensive orders
-- in each region.

SELECT *
FROM (
    SELECT
        order_id,
        customer,
        region,
        price,
        ROW_NUMBER() OVER (
            PARTITION BY region
            ORDER BY price DESC
        ) AS row_num
    FROM sales
) AS ranked_sales
WHERE row_num <= 2;


-- Q5. Find the highest quantity order
-- in each category.

SELECT *
FROM (
    SELECT
        order_id,
        customer,
        category,
        quantity,
        ROW_NUMBER() OVER (
            PARTITION BY category
            ORDER BY quantity DESC
        ) AS row_num
    FROM sales
) AS ranked_sales
WHERE row_num = 1;


-- Q6. Find the top 2 orders by revenue
-- in each category.

SELECT *
FROM (
    SELECT
        order_id,
        customer,
        category,
        quantity * price AS revenue,
        ROW_NUMBER() OVER (
            PARTITION BY category
            ORDER BY quantity * price DESC
        ) AS row_num
    FROM sales
) AS ranked_sales
WHERE row_num <= 2;


-- Q7. Find the highest revenue order
-- in each region.

SELECT *
FROM (
    SELECT
        order_id,
        customer,
        region,
        quantity * price AS revenue,
        ROW_NUMBER() OVER (
            PARTITION BY region
            ORDER BY quantity * price DESC
        ) AS row_num
    FROM sales
) AS ranked_sales
WHERE row_num = 1;


-- Q8. Find the top 3 customers by age.

SELECT *
FROM (
    SELECT
        customer,
        age,
        ROW_NUMBER() OVER (
            ORDER BY age DESC
        ) AS row_num
    FROM customers
) AS ranked_customers
WHERE row_num <= 3;


-- Q9. Find the youngest customer
-- from each membership type.

SELECT *
FROM (
    SELECT
        customer,
        membership,
        age,
        ROW_NUMBER() OVER (
            PARTITION BY membership
            ORDER BY age ASC
        ) AS row_num
    FROM customers
) AS ranked_customers
WHERE row_num = 1;


-- Q10. Find the top 2 highest-revenue orders
-- from each region.

SELECT *
FROM (
    SELECT
        order_id,
        customer,
        region,
        quantity * price AS revenue,
        ROW_NUMBER() OVER (
            PARTITION BY region
            ORDER BY quantity * price DESC
        ) AS row_num
    FROM sales
) AS ranked_sales
WHERE row_num <= 2;