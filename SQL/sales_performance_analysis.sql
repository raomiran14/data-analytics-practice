
-- Day 13: Sales Performance Analysis
-- Business-Oriented SQL Practice

USE data_analytics_practice;


-- Q1. Show each order's revenue and cumulative revenue.
SELECT
    order_id,
    customer,
    quantity * price AS revenue,
    SUM(quantity * price) OVER (
        ORDER BY order_id
        ROWS UNBOUNDED PRECEDING
    ) AS cumulative_revenue
FROM sales;


-- Q2. Show each region's cumulative revenue.
SELECT
    order_id,
    region,
    quantity * price AS revenue,
    SUM(quantity * price) OVER (
        PARTITION BY region
        ORDER BY order_id
        ROWS UNBOUNDED PRECEDING
    ) AS region_cumulative_revenue
FROM sales;


-- Q3. Compare each order's revenue with the
-- cumulative average revenue up to that order.
SELECT
    order_id,
    customer,
    quantity * price AS revenue,
    AVG(quantity * price) OVER (
        ORDER BY order_id
        ROWS UNBOUNDED PRECEDING
    ) AS cumulative_avg_revenue
FROM sales;


-- Q4. Calculate cumulative revenue for each category.
SELECT
    order_id,
    category,
    quantity * price AS revenue,
    SUM(quantity * price) OVER (
        PARTITION BY category
        ORDER BY order_id
        ROWS UNBOUNDED PRECEDING
    ) AS category_cumulative_revenue
FROM sales;


-- Q5. Show the running percentage of total revenue.
SELECT
    order_id,
    customer,
    quantity * price AS revenue,
    ROUND(
        100.0 * SUM(quantity * price) OVER (
            ORDER BY order_id
            ROWS UNBOUNDED PRECEDING
        ) / SUM(quantity * price) OVER (),
        2
    ) AS running_revenue_percentage
FROM sales;


-- Q6. Calculate running quantity by region.
SELECT
    order_id,
    region,
    quantity,
    SUM(quantity) OVER (
        PARTITION BY region
        ORDER BY order_id
        ROWS UNBOUNDED PRECEDING
    ) AS region_running_quantity
FROM sales;


-- Q7. Calculate the running average order price by region.
SELECT
    order_id,
    region,
    price,
    ROUND(
        AVG(price) OVER (
            PARTITION BY region
            ORDER BY order_id
            ROWS UNBOUNDED PRECEDING
        ),
        2
    ) AS region_running_avg_price
FROM sales;


-- Q8. Show each order's revenue and the previous
-- running revenue total.
SELECT
    order_id,
    quantity * price AS revenue,
    SUM(quantity * price) OVER (
        ORDER BY order_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING
    ) AS previous_running_revenue
FROM sales;


-- Q9. Calculate cumulative revenue by category
-- and rank the orders by their revenue.
SELECT
    order_id,
    customer,
    category,
    quantity * price AS revenue,
    SUM(quantity * price) OVER (
        PARTITION BY category
        ORDER BY order_id
        ROWS UNBOUNDED PRECEDING
    ) AS category_running_revenue,
    RANK() OVER (
        PARTITION BY category
        ORDER BY quantity * price DESC
    ) AS category_revenue_rank
FROM sales;


-- Q10. Calculate cumulative revenue and cumulative
-- average price for every region.
SELECT
    order_id,
    region,
    quantity * price AS revenue,
    SUM(quantity * price) OVER (
        PARTITION BY region
        ORDER BY order_id
        ROWS UNBOUNDED PRECEDING
    ) AS running_revenue,
    AVG(price) OVER (
        PARTITION BY region
        ORDER BY order_id
        ROWS UNBOUNDED PRECEDING
    ) AS running_avg_price
FROM sales;
