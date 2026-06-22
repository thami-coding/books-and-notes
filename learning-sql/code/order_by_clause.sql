-- In general, the rows in a result set returned from a query are not in any particular order. 
-- If you want your result set to be sorted, you will need to instruct the server to sort the 
-- results using the order by clause

-- The order by clause is the mechanism for sorting your result set using either raw
-- column data or expressions based on column data.

-- The order by clause tells the server how to sort the data returned by the query. Without
-- the order by clause, there is no guarantee that the data in the table will be retrieved in
-- any particular order.

-- If you would like the results to be in alphabetical order by last name, you can add the
-- last_name column to the order by clause:
SELECT c.first_name, c.last_name, 
time(r.rental_date) rental_time
FROM customer c
INNER JOIN rental r
ON c.customer_id = r.customer_id
WHERE date(r.rental_date) = '2005-06-14'
ORDER BY c.last_name;

-- You can accomplish this by adding the first_name column after the last_name column in the
-- order by clause:
SELECT c.first_name, c.last_name,
time(r.rental_date) rental_time
FROM customer c
INNER JOIN rental r
ON c.customer_id = r.customer_id
WHERE date(r.rental_date) = '2005-06-14'
ORDER BY c.last_name, c.first_name;

-- The order in which columns appear in your order by clause does make a difference 
-- when you include more than one column. If you were to switch the order of the two 
-- columns in the order by clause, Amber Dixon would appear first in the result set
-- +------------+-----------+-------------+ 
-- | first_name | last_name | rental_time | 
-- +------------+-----------+-------------+ 
-- | DANIEL     | CABRAL    | 23:09:38    | 
-- | CATHERINE  | CAMPBELL  | 23:17:03    | 
-- | HERMAN     | DEVORE    | 23:35:09    | 
-- | AMBER      | DIXON     | 23:42:56    | 
-- | JOYCE      | EDWARDS   | 23:16:26    | 
-- | JEANETTE   | GREENE    | 23:54:46    | 
-- | SONIA      | GREGORY   | 23:50:11    | 
-- | TERRENCE   | GUNDERSON | 23:47:35    | 
-- | CHARLES    | KOWALSKI  | 23:54:34    | 
-- | MATTHEW    | MAHAN     | 23:25:58    | 
-- | GWENDOLYN  | MAY       | 23:16:27    | 
-- | MIRIAM     | MCKINNEY  | 23:07:08    | 
-- | ELMER      | NOE       | 22:55:13    | 
-- | JEFFERY    | PINSON    | 22:53:33    | 
-- | MINNIE     | ROMERO    | 23:00:34    | 
-- | TERRANCE   | ROUSH     | 23:12:46    | 
-- +------------+-----------+-------------+

-- The order in which columns appear in your order by clause does make a difference when you
 -- include more than one column. If you were to switch the order of the two columns in the order 
 -- by clause, Amber Dixon would appear first in the result set.

 -- Ascending Versus Descending Sort Order When sorting, you have the option of specifying ascending 
 -- or descending order via the asc and desc keywords. 
 -- The default is ascending, so you will need to add the desc keyword if you want to use a descending sort.

SELECT c.first_name, c.last_name,
time(r.rental_date) rental_time
FROM customer c
INNER JOIN rental r
ON c.customer_id = r.customer_id
WHERE date(r.rental_date) = '2005-06-14'
ORDER BY time(r.rental_date) desc;

--  +------------+-----------+-------------+ 
-- | first_name | last_name | rental_time | 
-- +------------+-----------+-------------+ 
-- | JEANETTE   | GREENE    | 23:54:46    | 
-- | CHARLES    | KOWALSKI  | 23:54:34    | 
-- | SONIA      | GREGORY   | 23:50:11    |
-- | TERRENCE   | GUNDERSON | 23:47:35    | 
-- | AMBER      | DIXON     | 23:42:56    | 
-- | HERMAN     | DEVORE    | 23:35:09    | 
-- | MATTHEW    | MAHAN     | 23:25:58    | 
-- | CATHERINE  | CAMPBELL  | 23:17:03    | 
-- | GWENDOLYN  | MAY       | 23:16:27    | 
-- | JOYCE      | EDWARDS   | 23:16:26    | 
-- | TERRANCE   | ROUSH     | 23:12:46    | 
-- | DANIEL     | CABRAL    | 23:09:38    | 
-- | MIRIAM     | MCKINNEY  | 23:07:08    | 
-- | MINNIE     | ROMERO    | 23:00:34    | 
-- | ELMER      | NOE       | 22:55:13    | 
-- | JEFFERY    | PINSON    | 22:53:33    | 
-- +------------+-----------+-------------+

-- Descending sorts are commonly used for ranking queries, such as “show me the top five
-- account balances.” MySQL includes a 
-- limit clause that allows you to sort your data and then discard all but the first X rows