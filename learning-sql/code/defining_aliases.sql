-- Defining Table Aliases When multiple tables are joined in a single query, you need a way to identify 
-- which table you are referring to when you reference columns in the select , where , group by , having , 
-- and order by clauses.
-- You have two choices when referencing a table outside the from clause: Use the entire table name, such 
-- as employee.emp_id . Assign each table an alias and use the alias throughout the query.
select c.first_name, c.last_name,
time(r.rental_date) rental_time
FROM customer c
INNER JOIN rental r
ON c.customer_id= r.customer_id
WHERE date(r.rental_date) = '2005-06-14'

-- If you look closely at the from clause, you will see that the customer table is assigned the alias 
-- c , and the rental table is assigned the alias r . 
-- These aliases are then used in the on clause when defining the join condition as well as in the select 
-- clause when specifying the columns to include in the result set.
select c.first_name, c.last_name,
time(r.rental_date) rental_time
FROM customer AS c
INNER JOIN rental AS r
ON c.customer_id = r.customer_id
WHERE date(r.rental_date) = '2005-06-14'

-- I have found that roughly half of the database developers I have worked with use the as keyword 
-- with their column and table aliases, and half do not.