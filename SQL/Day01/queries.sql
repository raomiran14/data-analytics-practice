-- Day 01: SQL Basics

-- Q1. Display all orders
SELECT *
FROM sales;


-- Q2. Display only orders from Karachi
SELECT *
FROM sales
WHERE region = 'Karachi';


-- Q3. Display orders where price is greater than 800
SELECT *
FROM sales
WHERE price > 800;


-- Q4. Display orders sorted by price from highest to lowest
SELECT *
FROM sales
ORDER BY price DESC;


-- Q5. Find the total quantity sold
SELECT SUM(quantity) AS total_quantity
FROM sales;


-- Q6. Find the average price
SELECT AVG(price) AS average_price
FROM sales;


-- Q7. Find the total quantity sold for each category
SELECT
    category,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY category;


-- Q8. Find the average price for each region
SELECT
    region,
    AVG(price) AS average_price
FROM sales
GROUP BY region;