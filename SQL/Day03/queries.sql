-- Day 03: HAVING Clause

USE data_analytics_practice;


-- Q1. Find categories that sold more than 10 products

SELECT
    category,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY category
HAVING SUM(quantity) > 10;


-- Q2. Find regions with more than 3 orders

SELECT
    region,
    COUNT(*) AS total_orders
FROM sales
GROUP BY region
HAVING COUNT(*) > 3;


-- Q3. Find categories with an average price greater than 800

SELECT
    category,
    ROUND(AVG(price), 2) AS average_price
FROM sales
GROUP BY category
HAVING AVG(price) > 800;


-- Q4. Find regions with total revenue greater than 5,000

SELECT
    region,
    SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY region
HAVING SUM(quantity * price) > 5000;


-- Q5. Find categories with at least 5 orders

SELECT
    category,
    COUNT(*) AS total_orders
FROM sales
GROUP BY category
HAVING COUNT(*) >= 5;


-- Q6. Find regions where average price is less than 900

SELECT
    region,
    ROUND(AVG(price), 2) AS average_price
FROM sales
GROUP BY region
HAVING AVG(price) < 900;


-- Q7. Find categories where total quantity is between 8 and 15

SELECT
    category,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY category
HAVING SUM(quantity) BETWEEN 8 AND 15;


-- Q8. Find regions with more than 2 orders
-- and average price greater than 700

SELECT
    region,
    COUNT(*) AS total_orders,
    ROUND(AVG(price), 2) AS average_price
FROM sales
GROUP BY region
HAVING COUNT(*) > 2
   AND AVG(price) > 700;


-- Q9. Find categories with total revenue greater than 9,000

SELECT
    category,
    SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY category
HAVING SUM(quantity * price) > 9000;


-- Q10. Find regions with revenue greater than 5,000
-- sorted from highest to lowest

SELECT
    region,
    SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY region
HAVING SUM(quantity * price) > 5000
ORDER BY total_revenue DESC;