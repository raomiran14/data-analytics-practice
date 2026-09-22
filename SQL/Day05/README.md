# Day 05 - SQL LEFT JOIN

## Topics Covered

- LEFT JOIN
- ON
- IS NULL
- DISTINCT
- COUNT()
- SUM()
- GROUP BY
- ORDER BY
- Finding unmatched records

## Tables Used

### sales

Contains:

- Order information
- Customer names
- Product categories
- Quantity
- Price
- Region

### customers

Contains:

- Customer ID
- Customer name
- Membership type
- Customer age

## Questions Solved

1. Display all sales with customer information.
2. Find sales where customer information is missing.
3. Count all sales records.
4. Count sales with matching customer information.
5. Display all sales and membership.
6. Calculate revenue by membership.
7. Calculate total quantity by membership.
8. Find customers missing from the customer table.
9. Count unmatched sales.
10. Display all sales ordered by price.

## Key Learning

LEFT JOIN keeps all records from the left table.

If a matching record does not exist in the right table,
SQL returns NULL for the right table's columns.

Also practiced using LEFT JOIN to identify unmatched
and missing records.