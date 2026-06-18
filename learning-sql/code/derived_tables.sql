-- A subquery is a query contained within another query.
-- Subqueries are surrounded by parentheses and can be found 
-- in various parts of a select statement;

-- within the  from clause, however, a subquery serves the role of generating a derived table that is visible
-- from all other query clauses and can interact with other tables named in the  from clause.
SELECT concat(cust.last_name, ', ', cust.first_name) full_name
FROM
(
    SELECT first_name, last_name, email
    FROM customer
    WHERE first_name = 'JESSIE'
) cust;

-- +---------------+ 
-- | full_name     | 
-- +---------------+ 
-- | BANKS, JESSIE | 
-- | MILAM, JESSIE | 
-- +---------------+ 