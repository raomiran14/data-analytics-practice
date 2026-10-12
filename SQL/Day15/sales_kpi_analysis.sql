
USE data_analytics_practice;

-- Q1. Calculate total revenue, orders, and units sold.
SELECT
    SUM(quantity * price) AS total_revenue,
    COUNT(*) AS total_orders,
    SUM(quantity) AS total_units_sold
FROM sales;


-- Q2. Calculate average order value (AOV).
SELECT
    ROUND(AVG(quantity * price), 2) AS average_order_value
FROM sales;


-- Q3. Calculate each region's share of total revenue.
SELECT
    region,
    SUM(quantity * price) AS total_revenue,
    ROUND(
        SUM(quantity * price) * 100.0 /
        (SELECT SUM(quantity * price) FROM sales),
        2
    ) AS revenue_percentage
FROM sales
GROUP BY region
ORDER BY total_revenue DESC;


-- Q4. Find the best-performing product category.
SELECT
    category,
    SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY category
ORDER BY total_revenue DESC
LIMIT 1;


-- Q5. Find customers who spent more than 2000
-- across all their orders.
SELECT
    customer,
    SUM(quantity * price) AS total_spending
FROM sales
GROUP BY customer
HAVING SUM(quantity * price) > 2000
ORDER BY total_spending DESC;


-- Q6. Calculate each region's average order value.
SELECT
    region,
    ROUND(AVG(quantity * price), 2) AS avg_order_value
FROM sales
GROUP BY region
ORDER BY avg_order_value DESC;


-- Q7. Find the percentage of orders with revenue
-- greater than or equal to 2000.
SELECT
    ROUND(
        SUM(CASE WHEN quantity * price >= 2000
            THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS high_revenue_order_percentage
FROM sales;


-- Q8. Find the highest-revenue order in each category.
WITH ranked_orders AS (
    SELECT
        order_id,
        customer,
        category,
        quantity * price AS revenue,
        ROW_NUMBER() OVER (
            PARTITION BY category
            ORDER BY quantity * price DESC, order_id
        ) AS rn
    FROM sales
)
SELECT order_id, customer, category, revenue
FROM ranked_orders
WHERE rn = 1;


-- Q9. Compare Electronics and Clothing revenue.
SELECT
    category,
    SUM(quantity * price) AS total_revenue,
    SUM(quantity) AS units_sold,
    COUNT(*) AS total_orders
FROM sales
GROUP BY category
ORDER BY total_revenue DESC;


-- Q10. Classify regions by their total revenue.
WITH regional_revenue AS (
    SELECT
        region,
        SUM(quantity * price) AS total_revenue
    FROM sales
    GROUP BY region
)
SELECT
    region,
    total_revenue,
    CASE
        WHEN total_revenue >= 10000 THEN 'Strong'
        WHEN total_revenue >= 5000 THEN 'Moderate'
        ELSE 'Needs Improvement'
    END AS performance_level
FROM regional_revenue
ORDER BY total_revenue DESC;
