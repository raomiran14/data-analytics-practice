
USE data_analytics_practice;

-- Q1. Find each customer's total spending.
WITH customer_revenue AS (
    SELECT customer,
           SUM(quantity * price) AS total_revenue
    FROM sales
    GROUP BY customer
)
SELECT *
FROM customer_revenue
ORDER BY total_revenue DESC;


-- Q2. Find the highest-revenue customer.
WITH customer_revenue AS (
    SELECT customer,
           SUM(quantity * price) AS total_revenue
    FROM sales
    GROUP BY customer
)
SELECT *
FROM customer_revenue
ORDER BY total_revenue DESC
LIMIT 1;


-- Q3. Calculate revenue by membership type.
WITH customer_sales AS (
    SELECT c.customer,
           c.membership,
           s.quantity * s.price AS revenue
    FROM customers c
    INNER JOIN sales s
        ON c.customer = s.customer
)
SELECT membership,
       SUM(revenue) AS total_revenue,
       ROUND(AVG(revenue), 2) AS average_order_revenue
FROM customer_sales
GROUP BY membership
ORDER BY total_revenue DESC;


-- Q4. Compare total orders and revenue by region.
WITH regional_summary AS (
    SELECT region,
           COUNT(*) AS total_orders,
           SUM(quantity * price) AS total_revenue
    FROM sales
    GROUP BY region
)
SELECT *
FROM regional_summary
ORDER BY total_revenue DESC;


-- Q5. Find each category's percentage of total revenue.
WITH category_revenue AS (
    SELECT category,
           SUM(quantity * price) AS total_revenue
    FROM sales
    GROUP BY category
)
SELECT category,
       total_revenue,
       ROUND(
           total_revenue * 100.0 /
           SUM(total_revenue) OVER (),
           2
       ) AS revenue_percentage
FROM category_revenue
ORDER BY revenue_percentage DESC;


-- Q6. Find customers who generated above-average
-- customer revenue.
WITH customer_revenue AS (
    SELECT customer,
           SUM(quantity * price) AS total_revenue
    FROM sales
    GROUP BY customer
)
SELECT customer, total_revenue
FROM customer_revenue
WHERE total_revenue > (
    SELECT AVG(total_revenue)
    FROM customer_revenue
);


-- Q7. Find customers with no matching sales.
WITH customer_sales AS (
    SELECT c.customer,
           COUNT(s.order_id) AS total_orders
    FROM customers c
    LEFT JOIN sales s
        ON c.customer = s.customer
    GROUP BY c.customer
)
SELECT *
FROM customer_sales
WHERE total_orders = 0;


-- Q8. Find sales records with no matching customer.
WITH unmatched_sales AS (
    SELECT s.order_id,
           s.customer,
           s.quantity * s.price AS revenue
    FROM sales s
    LEFT JOIN customers c
        ON s.customer = c.customer
    WHERE c.customer_id IS NULL
)
SELECT *
FROM unmatched_sales;


-- Q9. Rank regions by total revenue.
WITH regional_revenue AS (
    SELECT region,
           SUM(quantity * price) AS total_revenue
    FROM sales
    GROUP BY region
)
SELECT region,
       total_revenue,
       DENSE_RANK() OVER (
           ORDER BY total_revenue DESC
       ) AS region_rank
FROM regional_revenue;


-- Q10. Identify each region's highest-revenue order.
WITH order_revenue AS (
    SELECT order_id,
           customer,
           region,
           quantity * price AS revenue
    FROM sales
),
ranked_orders AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY region
               ORDER BY revenue DESC, order_id
           ) AS order_rank
    FROM order_revenue
)
SELECT order_id, customer, region, revenue
FROM ranked_orders
WHERE order_rank = 1;
