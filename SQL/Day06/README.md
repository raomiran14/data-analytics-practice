# Day 06 - SQL RIGHT JOIN

## Topics Covered

- RIGHT JOIN
- ON
- IS NULL
- COALESCE()
- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()
- GROUP BY
- HAVING
- ORDER BY

## Tables Used

### sales

Contains:

- Order ID
- Customer
- Category
- Quantity
- Price
- Region

### customers

Contains:

- Customer ID
- Customer
- Membership
- Age

## Practice

The main queries practice:

- RIGHT JOIN
- Finding customers without orders
- Customer-level aggregation
- Revenue analysis
- Quantity analysis
- Filtering grouped results

Additional practice is available in:

`extra_practice.sql`

## Key Learning

RIGHT JOIN keeps all records from the right table.

If a customer has no matching order,
the sales columns contain NULL.

COALESCE() can be used to replace NULL
values with another value such as 0.