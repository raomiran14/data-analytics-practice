
-- Day 12: Sales Trend Analysis
-- Business-Oriented SQL Practice

USE data_analytics_practice;


-- Q1. Calculate the difference between consecutive order revenues.
SELECT
    order_id,
    customer,
    quantity * price AS revenue,
    LAG(quantity * price) OVER (ORDER BY order_id) AS previous_revenue,
    (quantity * price) -
        LAG(quantity * price) OVER (ORDER BY order_id) AS revenue_change
FROM sales;


-- Q2. Identify orders whose revenue is higher than the previous order.
SELECT *
FROM (
    SELECT
        order_id,
        customer,
        quantity * price AS revenue,
        LAG(quantity * price) OVER (ORDER BY order_id) AS previous_revenue
    FROM sales
) AS revenue_comparison
WHERE revenue > previous_revenue;


-- Q3. Identify orders whose revenue is lower than the previous order.
SELECT *
FROM (
    SELECT
        order_id,
        customer,
        quantity * price AS revenue,
        LAG(quantity * price) OVER (ORDER BY order_id) AS previous_revenue
    FROM sales
) AS revenue_comparison
WHERE revenue < previous_revenue;


-- Q4. Calculate the percentage change in revenue
-- compared with the previous order.
SELECT
    order_id,
    customer,
    quantity * price AS revenue,
    LAG(quantity * price) OVER (ORDER BY order_id) AS previous_revenue,
    ROUND(
        100.0 * (
            (quantity * price) -
            LAG(quantity * price) OVER (ORDER BY order_id)
        ) / NULLIF(
            LAG(quantity * price) OVER (ORDER BY order_id), 0
        ),
        2
    ) AS percentage_change
FROM sales;


-- Q5. Find the first order in each region
-- by order_id and compare it with the previous regional order.
SELECT
    order_id,
    customer,
    region,
    price,
    LAG(price) OVER (
        PARTITION BY region
        ORDER BY order_id
    ) AS previous_region_price
FROM sales;


-- Q6. Compare each order's quantity with the next order's quantity.
SELECT
    order_id,
    customer,
    quantity,
    LEAD(quantity) OVER (ORDER BY order_id) AS next_quantity,
    LEAD(quantity) OVER (ORDER BY order_id) - quantity AS next_quantity_change
FROM sales;


-- Q7. Compare each order's revenue with the next order's revenue.
SELECT
    order_id,
    customer,
    quantity * price AS revenue,
    LEAD(quantity * price) OVER (ORDER BY order_id) AS next_revenue
FROM sales;


-- Q8. Find orders with revenue above the previous order's revenue.
SELECT *
FROM (
    SELECT
        order_id,
        customer,
        quantity * price AS revenue,
        LAG(quantity * price) OVER (ORDER BY order_id) AS previous_revenue
    FROM sales
) AS comparison
WHERE revenue > previous_revenue;


-- Q9. Compare each customer's age with the next oldest age.
SELECT
    customer,
    age,
    LEAD(age) OVER (ORDER BY age DESC) AS next_younger_age
FROM customers;


-- Q10. Calculate revenue change between consecutive orders
-- within each product category.
SELECT
    order_id,
    customer,
    category,
    quantity * price AS revenue,
    LAG(quantity * price) OVER (
        PARTITION BY category
        ORDER BY order_id
    ) AS previous_category_revenue,
    (quantity * price) -
        LAG(quantity * price) OVER (
            PARTITION BY category
            ORDER BY order_id
        ) AS revenue_change
FROM sales;