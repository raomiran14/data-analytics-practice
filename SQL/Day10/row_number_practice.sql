-- Day 10: ROW_NUMBER()
-- SQL Data Analytics Practice

USE data_analytics_practice;


-- Q1. Assign a unique row number to every order
-- based on price from highest to lowest.

SELECT
    order_id,
    customer,
    price,
    ROW_NUMBER() OVER (
        ORDER BY price DESC
    ) AS row_num
FROM sales;


-- Q2. Assign row numbers based on quantity
-- from highest to lowest.

SELECT
    order_id,
    customer,
    quantity,
    ROW_NUMBER() OVER (
        ORDER BY quantity DESC
    ) AS row_num
FROM sales;


-- Q3. Assign row numbers separately for each category.

SELECT
    order_id,
    customer,
    category,
    price,
    ROW_NUMBER() OVER (
        PARTITION BY category
        ORDER BY price DESC
    ) AS row_num
FROM sales;


-- Q4. Assign row numbers separately for each region.

SELECT
    order_id,
    customer,
    region,
    price,
    ROW_NUMBER() OVER (
        PARTITION BY region
        ORDER BY price DESC
    ) AS row_num
FROM sales;


-- Q5. Find the highest-priced order in each category.

SELECT *
FROM (
    SELECT
        order_id,
        customer,
        category,
        price,
        ROW_NUMBER() OVER (
            PARTITION BY category
            ORDER BY price DESC
        ) AS row_num
    FROM sales
) AS ranked_sales
WHERE row_num = 1;


-- Q6. Find the highest-priced order in each region.

SELECT *
FROM (
    SELECT
        order_id,
        customer,
        region,
        price,
        ROW_NUMBER() OVER (
            PARTITION BY region
            ORDER BY price DESC
        ) AS row_num
    FROM sales
) AS ranked_sales
WHERE row_num = 1;


-- Q7. Find the two highest-priced orders
-- from each category.

SELECT *
FROM (
    SELECT
        order_id,
        customer,
        category,
        price,
        ROW_NUMBER() OVER (
            PARTITION BY category
            ORDER BY price DESC
        ) AS row_num
    FROM sales
) AS ranked_sales
WHERE row_num <= 2;


-- Q8. Find the two highest-priced orders
-- from each region.

SELECT *
FROM (
    SELECT
        order_id,
        customer,
        region,
        price,
        ROW_NUMBER() OVER (
            PARTITION BY region
            ORDER BY price DESC
        ) AS row_num
    FROM sales
) AS ranked_sales
WHERE row_num <= 2;


-- Q9. Number all customers by age from
-- oldest to youngest.

SELECT
    customer,
    age,
    ROW_NUMBER() OVER (
        ORDER BY age DESC
    ) AS row_num
FROM customers;


-- Q10. Number Premium and Regular customers
-- separately by age.

SELECT
    customer,
    membership,
    age,
    ROW_NUMBER() OVER (
        PARTITION BY membership
        ORDER BY age DESC
    ) AS row_num
FROM customers;