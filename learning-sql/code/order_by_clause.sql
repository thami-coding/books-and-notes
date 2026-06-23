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

-- Sorting via Numeric Placeholders 
-- If you are sorting using the columns in your select clause, you can opt to reference the 
-- columns by their position in the select clause rather than by name. This can be especially 
-- helpful if you are sorting on an expression, such as in the previous example.
SELECT c.first_name, c.last_name,
time(r.rental_date) rental_time
FROM customer c
INNER JOIN rental r
ON c.customer_id = r.customer_id
WHERE date(r.rental_date) = '2005-06-14'
ORDER BY 3 desc;

-- +------------+-----------+-------------+ 
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

-- You might want to use this feature sparingly, since adding a column to the select 
-- clause without changing the numbers in the order by clause can lead to unexpected results.

-- Personally,I may reference columns positionally when writing ad hoc queries,
-- but I always reference columns by name when writing code

-- no matter how many conditions are in your where clause, if they are separated by
-- the and operator, they must all evaluate to true for the row to be included in the result set.
-- ex. WHERE first_name = 'STEVEN' OR create_date > '2006-01-01'

-- Using Parenthese
-- If your where clause includes three or more conditions using both the and and or operators, you should 
-- use parentheses to make your intent clear, both to the database server and to anyone else reading your code.
WHERE (first_name = 'STEVEN' OR last_name = 'YOUNG')
    AND create_date > '2006-01-01'
-- first name is Steven or the last name
-- is Young, and the creation date is after January 1, 2006:

WHERE NOT (first_name = 'STEVEN' OR last_name = 'YOUNG') 
AND create_date > '2006-01-01'
-- Now, instead of looking for people with the first name of Steven
-- or the last name of Young whose record was created after January 1, 2006, I am
-- retrieving only rows where the first name is not Steven or the last name is not Young
-- whose record was created after January 1, 2006. 

-- While it is easy for the database server to handle, it is typically difficult for a person to
-- evaluate a where clause that includes the not operator, which is why you won’t encounter it very often

-- In this case, you can rewrite the where clause to avoid using the not operator:
WHERE first_name <> 'STEVEN' AND last_name <> 'YOUNG'
    AND create_date > '2006-01-01'


-- Building a Condition
-- A condition is made up of one or more expressions combined with one or more operators.
-- An expression can be any of the following:
-- 1. A number
-- 2. A column in a table or view
-- 3. A string literal, such as 
-- 4. 'Maple Street'
-- 5. A built-in function, such as 
-- 6. concat('Learning', ' ', 'SQL')
-- 7. A subquery
-- 8. A list of expressions, such as 
-- 9. ('Boston', 'New York', 'Chicago'

-- The operators used within conditions include: 
-- 1. Comparison operators, such as = , != , < , > , <> , like , in , and between 
-- 2. Arithmetic operators, such as + , − , * , and /


-- Condition Types
-- There are many different ways to filter out unwanted data. You can look for specific
-- values, sets of values, or ranges of values to include or exclude, or you can use various
-- pattern-searching techniques to look for partial matches when dealing with string data.