-- The second deviation from the simple 
-- from clause definition is the mandate that if more
-- than one table appears in the  from clause, the conditions
-- used to link the tables must beincluded as well. 

-- This is not a requirement of MySQL or any other database server, but
-- it is the ANSI-approved method of joining multiple tables, and it is the most portable
-- across the various database servers.

SELECT customer.first_name, customer.last_name, time(rental.rental_date) rental_time
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
