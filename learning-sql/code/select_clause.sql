-- The select clause determines which of all possible columns should be included in
-- the query’s result set.

-- Show me all the columns and all the rows in the language table.
SELECT *  FROM language;

-- In addition to specifying all the columns via the asterisk character, you can explicitly
-- name the columns you are interested in, such as:
SELECT language_id, name, last_update  FROM language;

SELECT name  FROM language;

CATHERINE  | CAMPBELL  | 23:17:03    
| MATTHEW    
| MAHAN     
| HERMAN     
| AMBER      
| DEVORE    
| DIXON     
| 23:25:58    
| 23:35:09    
| 23:42:56    
| TERRENCE   | GUNDERSON | 23:47:35    
| SONIA      
| CHARLES    
| 
| 
| 
| 
| 
| 
| 
| 
+------------+-----------+-------------+

-- you can spice things up in your select clause by including things such as:
-- 1. Literals, such as numbers or strings.
-- 2. Expressions, such as transaction.amount * −1.
-- 3. Built-in function calls, such as ROUND(transaction.amount, 2).
-- 4. User-defined function calls.
SELECT language_id, 'COMMON' language_usage, language_id * 3.1415927 lang_pi_value,
upper(name) language_name
FROM language;
-- +-------------+----------------+---------------+---------------+ 
-- | language_id | language_usage | lang_pi_value | language_name | 
-- +-------------+----------------+---------------+---------------+ 
-- |           1 | COMMON         |     3.1415927 | ENGLISH       | 
-- |           2 | COMMON         |     6.2831854 | ITALIAN       | 
-- |           3 | COMMON         |     9.4247781 | JAPANESE      | 
-- |           4 | COMMON         |    12.5663708 | MANDARIN      | 
-- |           5 | COMMON         |    15.7079635 | FRENCH        | 
-- |           6 | COMMON         |    18.8495562 | GERMAN        | 
-- +-------------+----------------+---------------+---------------+ 

-- If you only need to execute a built-in function or evaluate a simple expression, you can skip the 
-- from clause entirely.
SELECT version(),  user (),  database();