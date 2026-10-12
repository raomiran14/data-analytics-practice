
USE data_analytics_practice;

-- Q1. Calculate revenue for each order and classify it.
SELECT
    order_id,
    customer,
    quantity * price AS revenue,
    CASE
        WHEN quantity * price >= 2000 THEN 'High'
        WHEN quantity * price >= 1000 THEN 'Medium'
        ELSE 'Low'
    END AS revenue_category
FROM sales;


-- Q2. Count high-revenue and low-revenue orders.
SELECT
    SUM(CASE WHEN quantity * price >= 2000
        THEN 1 ELSE 0 END) AS high_revenue_orders,
    SUM(CASE WHEN quantity * price < 2000
        THEN 1 ELSE 0 END) AS low_revenue_orders
FROM sales;


-- Q3. Calculate revenue from each product category.
SELECT
    SUM(CASE WHEN category = 'Electronics'
        THEN quantity * price ELSE 0 END) AS electronics_revenue,
    SUM(CASE WHEN category = 'Clothing'
        THEN quantity * price ELSE 0 END) AS clothing_revenue
FROM sales;


-- Q4. Count orders from each region in separate columns.
SELECT
    SUM(CASE WHEN region = 'Karachi'
        THEN 1 ELSE 0 END) AS karachi_orders,
    SUM(CASE WHEN region = 'Lahore'
        THEN 1 ELSE 0 END) AS lahore_orders,
    SUM(CASE WHEN region = 'Islamabad'
        THEN 1 ELSE 0 END) AS islamabad_orders
FROM sales;


-- Q5. Calculate average revenue for each category.
SELECT
    category,
    ROUND(AVG(quantity * price), 2) AS avg_order_revenue
FROM sales
GROUP BY category;


-- Q6. Count orders and calculate revenue by region.
SELECT
    region,
    COUNT(*) AS total_orders,
    SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY region;


-- Q7. Count how many orders fall into each revenue level.
SELECT
    CASE
        WHEN quantity * price >= 2000 THEN 'High'
        WHEN quantity * price >= 1000 THEN 'Medium'
        ELSE 'Low'
    END AS revenue_level,
    COUNT(*) AS total_orders
FROM sales
GROUP BY revenue_level;


-- Q8. Calculate total quantity sold for each category.
SELECT
    category,
    SUM(quantity) AS units_sold
FROM sales
GROUP BY category;


-- Q9. Count orders with quantity greater than 2.
SELECT
    SUM(CASE WHEN quantity > 2
        THEN 1 ELSE 0 END) AS orders_over_2_units
FROM sales;


-- Q10. Compare high-revenue and low-revenue sales
-- for each region.
SELECT
    region,
    SUM(CASE WHEN quantity * price >= 2000
        THEN quantity * price ELSE 0 END) AS high_revenue,
    SUM(CASE WHEN quantity * price < 2000
        THEN quantity * price ELSE 0 END) AS low_revenue
FROM sales
GROUP BY region;
