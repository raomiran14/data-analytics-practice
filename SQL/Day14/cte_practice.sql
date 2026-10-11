
USE data_analytics_practice;

-- Q1. Calculate revenue for every order using a CTE.
WITH order_revenue AS (
    SELECT order_id,
           customer,
           quantity * price AS revenue
    FROM sales
)
SELECT *
FROM order_revenue;


-- Q2. Find orders with revenue greater than 1500.
WITH order_revenue AS (
    SELECT order_id,
           customer,
           quantity * price AS revenue
    FROM sales
)
SELECT *
FROM order_revenue
WHERE revenue > 1500;


-- Q3. Calculate total revenue for each customer.
WITH customer_revenue AS (
    SELECT customer,
           SUM(quantity * price) AS total_revenue
    FROM sales
    GROUP BY customer
)
SELECT *
FROM customer_revenue
ORDER BY total_revenue DESC;


-- Q4. Find customers whose total revenue exceeds 2000.
WITH customer_revenue AS (
    SELECT customer,
           SUM(quantity * price) AS total_revenue
    FROM sales
    GROUP BY customer
)
SELECT *
FROM customer_revenue
WHERE total_revenue > 2000;


-- Q5. Calculate average order revenue.
WITH order_revenue AS (
    SELECT quantity * price AS revenue
    FROM sales
)
SELECT ROUND(AVG(revenue), 2) AS average_order_revenue
FROM order_revenue;


-- Q6. Find categories with total revenue above 5000.
WITH category_revenue AS (
    SELECT category,
           SUM(quantity * price) AS total_revenue
    FROM sales
    GROUP BY category
)
SELECT *
FROM category_revenue
WHERE total_revenue > 5000;


-- Q7. Calculate total revenue for every region.
WITH regional_revenue AS (
    SELECT region,
           SUM(quantity * price) AS total_revenue
    FROM sales
    GROUP BY region
)
SELECT *
FROM regional_revenue
ORDER BY total_revenue DESC;


-- Q8. Find orders whose revenue is greater than
-- the average revenue of all orders.
WITH order_revenue AS (
    SELECT order_id,
           customer,
           quantity * price AS revenue
    FROM sales
),
average_revenue AS (
    SELECT AVG(revenue) AS avg_revenue
    FROM order_revenue
)
SELECT *
FROM order_revenue
WHERE revenue > (SELECT avg_revenue FROM average_revenue);


-- Q9. Use two CTEs to compare category revenue
-- with average order revenue.
WITH category_revenue AS (
    SELECT category,
           SUM(quantity * price) AS total_revenue
    FROM sales
    GROUP BY category
),
average_order AS (
    SELECT AVG(quantity * price) AS avg_revenue
    FROM sales
)
SELECT category,
       total_revenue,
       ROUND(avg_revenue, 2) AS average_order_revenue
FROM category_revenue
CROSS JOIN average_order;


-- Q10. Rank customers by their total revenue.
WITH customer_revenue AS (
    SELECT customer,
           SUM(quantity * price) AS total_revenue
    FROM sales
    GROUP BY customer
)
SELECT customer,
       total_revenue,
       DENSE_RANK() OVER (
           ORDER BY total_revenue DESC
       ) AS revenue_rank
FROM customer_revenue;
