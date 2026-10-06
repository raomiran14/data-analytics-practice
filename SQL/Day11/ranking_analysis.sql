-- Day 11: Ranking Analysis
-- Business-Oriented SQL Practice

USE data_analytics_practice;


-- Q1. Find the highest-priced order.

SELECT *
FROM (
    SELECT
        order_id,
        customer,
        price,
        RANK() OVER (
            ORDER BY price DESC
        ) AS price_rank
    FROM sales
) AS ranked_sales
WHERE price_rank = 1;


-- Q2. Find the second-highest price.

SELECT *
FROM (
    SELECT
        order_id,
        customer,
        price,
        DENSE_RANK() OVER (
            ORDER BY price DESC
        ) AS price_rank
    FROM sales
) AS ranked_sales
WHERE price_rank = 2;


-- Q3. Find the top 3 prices.

SELECT *
FROM (
    SELECT
        order_id,
        customer,
        price,
        DENSE_RANK() OVER (
            ORDER BY price DESC
        ) AS price_rank
    FROM sales
) AS ranked_sales
WHERE price_rank <= 3;


-- Q4. Find the highest-priced order in each category.

SELECT *
FROM (
    SELECT
        order_id,
        customer,
        category,
        price,
        RANK() OVER (
            PARTITION BY category
            ORDER BY price DESC
        ) AS category_rank
    FROM sales
) AS ranked_sales
WHERE category_rank = 1;


-- Q5. Find the second-highest price in each category.

SELECT *
FROM (
    SELECT
        order_id,
        customer,
        category,
        price,
        DENSE_RANK() OVER (
            PARTITION BY category
            ORDER BY price DESC
        ) AS category_rank
    FROM sales
) AS ranked_sales
WHERE category_rank = 2;


-- Q6. Find the top 2 revenue orders in each region.

SELECT *
FROM (
    SELECT
        order_id,
        customer,
        region,
        quantity * price AS revenue,
        DENSE_RANK() OVER (
            PARTITION BY region
            ORDER BY quantity * price DESC
        ) AS revenue_rank
    FROM sales
) AS ranked_sales
WHERE revenue_rank <= 2;


-- Q7. Find the oldest customer in each membership group.

SELECT *
FROM (
    SELECT
        customer,
        membership,
        age,
        RANK() OVER (
            PARTITION BY membership
            ORDER BY age DESC
        ) AS age_rank
    FROM customers
) AS ranked_customers
WHERE age_rank = 1;


-- Q8. Find the second-oldest customer in each membership group.

SELECT *
FROM (
    SELECT
        customer,
        membership,
        age,
        DENSE_RANK() OVER (
            PARTITION BY membership
            ORDER BY age DESC
        ) AS age_rank
    FROM customers
) AS ranked_customers
WHERE age_rank = 2;


-- Q9. Find the top 2 highest-priced orders
-- from each category.

SELECT *
FROM (
    SELECT
        order_id,
        customer,
        category,
        price,
        DENSE_RANK() OVER (
            PARTITION BY category
            ORDER BY price DESC
        ) AS price_rank
    FROM sales
) AS ranked_sales
WHERE price_rank <= 2;


-- Q10. Find the third-highest revenue order overall.

SELECT *
FROM (
    SELECT
        order_id,
        customer,
        quantity * price AS revenue,
        DENSE_RANK() OVER (
            ORDER BY quantity * price DESC
        ) AS revenue_rank
    FROM sales
) AS ranked_sales
WHERE revenue_rank = 3;