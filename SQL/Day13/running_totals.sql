
-- Day 13: Running Totals and Cumulative Averages
-- SQL Data Analytics Practice

USE data_analytics_practice;


-- Q1. Calculate running revenue across orders.
SELECT
    order_id,
    customer,
    quantity * price AS revenue,
    SUM(quantity * price) OVER (
        ORDER BY order_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_revenue
FROM sales;


-- Q2. Calculate running quantity across orders.
SELECT
    order_id,
    quantity,
    SUM(quantity) OVER (
        ORDER BY order_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_quantity
FROM sales;


-- Q3. Calculate cumulative average order price.
SELECT
    order_id,
    customer,
    price,
    AVG(price) OVER (
        ORDER BY order_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_avg_price
FROM sales;


-- Q4. Calculate running revenue separately for each region.
SELECT
    order_id,
    customer,
    region,
    quantity * price AS revenue,
    SUM(quantity * price) OVER (
        PARTITION BY region
        ORDER BY order_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS region_running_revenue
FROM sales;


-- Q5. Calculate running quantity separately for each category.
SELECT
    order_id,
    customer,
    category,
    quantity,
    SUM(quantity) OVER (
        PARTITION BY category
        ORDER BY order_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS category_running_quantity
FROM sales;


-- Q6. Calculate cumulative average price for each category.
SELECT
    order_id,
    category,
    price,
    AVG(price) OVER (
        PARTITION BY category
        ORDER BY order_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS category_cumulative_avg
FROM sales;


-- Q7. Calculate running order count.
SELECT
    order_id,
    customer,
    COUNT(*) OVER (
        ORDER BY order_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_order_count
FROM sales;


-- Q8. Calculate running revenue by region,
-- starting the running total again for each region.
SELECT
    order_id,
    region,
    quantity * price AS revenue,
    SUM(quantity * price) OVER (
        PARTITION BY region
        ORDER BY order_id
        ROWS UNBOUNDED PRECEDING
    ) AS running_revenue
FROM sales;


-- Q9. Calculate the difference between current
-- running revenue and previous running revenue.
SELECT
    order_id,
    quantity * price AS revenue,
    SUM(quantity * price) OVER (
        ORDER BY order_id
        ROWS UNBOUNDED PRECEDING
    ) AS running_revenue,
    SUM(quantity * price) OVER (
        ORDER BY order_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING
    ) AS previous_running_revenue
FROM sales;


-- Q10. Calculate cumulative average quantity
-- separately for each region.
SELECT
    order_id,
    region,
    quantity,
    AVG(quantity) OVER (
        PARTITION BY region
        ORDER BY order_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_avg_quantity
FROM sales;
