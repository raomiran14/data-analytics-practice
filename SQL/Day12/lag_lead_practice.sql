
-- Day 12: LAG() and LEAD()
-- SQL Data Analytics Practice

USE data_analytics_practice;


-- Q1. Display each order with the previous order's price.
SELECT
    order_id,
    customer,
    price,
    LAG(price) OVER (ORDER BY order_id) AS previous_price
FROM sales;


-- Q2. Display each order with the next order's price.
SELECT
    order_id,
    customer,
    price,
    LEAD(price) OVER (ORDER BY order_id) AS next_price
FROM sales;


-- Q3. Compare each order's price with the previous order.
SELECT
    order_id,
    customer,
    price,
    LAG(price) OVER (ORDER BY order_id) AS previous_price,
    price - LAG(price) OVER (ORDER BY order_id) AS price_difference
FROM sales;


-- Q4. Compare each order's quantity with the previous order.
SELECT
    order_id,
    customer,
    quantity,
    LAG(quantity) OVER (ORDER BY order_id) AS previous_quantity,
    quantity - LAG(quantity) OVER (ORDER BY order_id) AS quantity_difference
FROM sales;


-- Q5. Compare each order's revenue with the previous order.
SELECT
    order_id,
    customer,
    quantity * price AS revenue,
    LAG(quantity * price) OVER (ORDER BY order_id) AS previous_revenue
FROM sales;


-- Q6. Display each customer's age and the previous age
-- when customers are sorted by age.
SELECT
    customer,
    age,
    LAG(age) OVER (ORDER BY age) AS previous_age
FROM customers;


-- Q7. Display each customer's age and the next age.
SELECT
    customer,
    age,
    LEAD(age) OVER (ORDER BY age) AS next_age
FROM customers;


-- Q8. Compare order prices within each category.
SELECT
    order_id,
    customer,
    category,
    price,
    LAG(price) OVER (
        PARTITION BY category
        ORDER BY order_id
    ) AS previous_category_price
FROM sales;


-- Q9. Compare order prices within each region.
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


-- Q10. Show the next order's customer and price.
SELECT
    order_id,
    customer,
    price,
    LEAD(customer) OVER (ORDER BY order_id) AS next_customer,
    LEAD(price) OVER (ORDER BY order_id) AS next_price
FROM sales;