-- Day 02: GROUP BY and Aggregate Functions

USE data_analytics_practice;


-- Q1. Count total orders

SELECT COUNT(*) AS total_orders
FROM sales;


-- Q2. Calculate total quantity sold

SELECT SUM(quantity) AS total_quantity
FROM sales;


-- Q3. Calculate total revenue

SELECT SUM(quantity * price) AS total_revenue
FROM sales;


-- Q4. Calculate average product price

SELECT ROUND(AVG(price), 2) AS average_price
FROM sales;


-- Q5. Find minimum and maximum prices

SELECT
    MIN(price) AS minimum_price,
    MAX(price) AS maximum_price
FROM sales;


-- Q6. Count orders in each category

SELECT
    category,
    COUNT(*) AS total_orders
FROM sales
GROUP BY category;


-- Q7. Calculate total quantity by category

SELECT
    category,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY category;


-- Q8. Calculate total revenue by category

SELECT
    category,
    SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY category;


-- Q9. Calculate average price by region

SELECT
    region,
    ROUND(AVG(price), 2) AS average_price
FROM sales
GROUP BY region;


-- Q10. Calculate total revenue by region

SELECT
    region,
    SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY region;


-- Q11. Count orders by region

SELECT
    region,
    COUNT(*) AS total_orders
FROM sales
GROUP BY region;


-- Q12. Display category-wise revenue from highest to lowest

SELECT
    category,
    SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY category
ORDER BY total_revenue DESC;-- Day 02: GROUP BY and Aggregate Functions

USE data_analytics_practice;


-- Q1. Count total orders

SELECT COUNT(*) AS total_orders
FROM sales;


-- Q2. Calculate total quantity sold

SELECT SUM(quantity) AS total_quantity
FROM sales;


-- Q3. Calculate total revenue

SELECT SUM(quantity * price) AS total_revenue
FROM sales;


-- Q4. Calculate average product price

SELECT ROUND(AVG(price), 2) AS average_price
FROM sales;


-- Q5. Find minimum and maximum prices

SELECT
    MIN(price) AS minimum_price,
    MAX(price) AS maximum_price
FROM sales;


-- Q6. Count orders in each category

SELECT
    category,
    COUNT(*) AS total_orders
FROM sales
GROUP BY category;


-- Q7. Calculate total quantity by category

SELECT
    category,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY category;


-- Q8. Calculate total revenue by category

SELECT
    category,
    SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY category;


-- Q9. Calculate average price by region

SELECT
    region,
    ROUND(AVG(price), 2) AS average_price
FROM sales
GROUP BY region;


-- Q10. Calculate total revenue by region

SELECT
    region,
    SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY region;


-- Q11. Count orders by region

SELECT
    region,
    COUNT(*) AS total_orders
FROM sales
GROUP BY region;


-- Q12. Display category-wise revenue from highest to lowest

SELECT
    category,
    SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY category
ORDER BY total_revenue DESC;