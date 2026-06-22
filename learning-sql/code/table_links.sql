-- The second deviation from the simple 
-- from clause definition is the mandate that if more
-- than one table appears in the  from clause, the conditions
-- used to link the tables must beincluded as well. 

-- This is not a requirement of MySQL or any other database server, but
-- it is the ANSI-approved method of joining multiple tables, and it is the most portable
-- across the various database servers.

SELECT customer.first_name, customer.last_name, 
time(rental.rental_date) rental_time
FROM customer
INNER JOIN rental 
ON customer.customer_id = rental.customer_id
WHERE date(rental.rental_date) = '2005-06-14';

-- +------------+-----------+-------------+ 
-- | first_name | last_name | rental_time | 
-- +------------+-----------+-------------+ 
-- | JEFFERY    | PINSON    | 22:53:33    | 
-- | ELMER      | NOE       | 22:55:13    | 
-- | MINNIE     | ROMERO    | 23:00:34    | 
-- | MIRIAM     | MCKINNEY  | 23:07:08    | 
-- | DANIEL     | CABRAL    | 23:09:38    | 
-- | TERRANCE   | ROUSH     | 23:12:46    | 
-- | JOYCE      | EDWARDS   | 23:16:26    | 
-- | GWENDOLYN  | MAY       | 23:16:27    |


-- The previous query displays data from both the   customer   table (  first_name  ,  last_name  ) 
-- and the   rental   table (  rental_date  ), so both tables are included in the  from   clause. 
-- The mechanism for linking the two tables (referred to as a join) is the  customer ID stored in 
-- both the   customer   and   rental   tables. Thus, the database server  is instructed to use the 
-- value of the   customer_id   column in the   customer   table to find  all of the customer’s rentals
-- in the   rental   table. Join conditions for the two tables are  found in the   on   subclause of the   from   clause;

-- in this case, the join condition is   ON  customer.customer_id = rental.customer_id .
-- The   where   clause is not part of the  join and is only included to keep the result set 
-- fairly small, since there are more than  16,000 rows in the   rental   table.