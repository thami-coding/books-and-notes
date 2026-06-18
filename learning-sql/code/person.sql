CREATE TABLE person (
    person_id SMALLINT UNSIGNED,
    fname VARCHAR(20),
    lname VARCHAR(20),
    eye_color CHAR(2),
    birth_date DATE,
    street VARCHAR(30),
    city VARCHAR(20),
    state VARCHAR(20),
    country VARCHAR(20),
    postal_code VARCHAR(20),
    CONSTRAINT pk_person PRIMARY KEY (person_id)
);

ALTER TABLE person MODIFY person_id SMALLINT UNSIGNED AUTO_INCREMENT;

DELETE FROM person WHERE person_id = 2;

UPDATE person
SET street = '1225 Tremont St.',
    city = 'Boston',
    state = 'MA',
    country = 'USA',
    postal_code = '02138'
WHERE
    person_id = 1;


SELECT food 
FROM favorite_food
WHERE person_id = 1
ORDER BY food;

show tables;
desc customer;
DROP TABLE favorite_food;


SELECT
    language_id,
    'COMMON' AS language_usage,
    language_id * 3.1415927 AS lang_pi_value,
    upper(name) AS language_name
FROM language;

SELECT
    language_id,
    'COMMON' language_usage,
    language_id * 3.1415927 lang_pi_value,
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
SELECT version(),user(), database();
-- +-----------+----------------+------------+ 
-- | version() | user()         | database() | 
-- +-----------+----------------+------------+ 
-- | 8.0.15    | root@localhost | sakila     | 
-- +-----------+----------------+------------+
SELECT DISTINCT actor_id FROM film_actor ORDER BY actor_id;

-- Permanent tables (i.e., created using the -- create table statement)
-- Derived tables (i.e., rows returned by a subquery and held in memory)
-- Temporary tables (i.e., volatile data held in memory)
-- Virtual tables (i.e., created using the create view statement)

SELECT CONCAT(cust.last_name, ', ', cust.first_name) 
FROM 
(SELECT first_name, last_name, email 
FROM customer
WHERE first_name = 'JESSIE') cust;

CREATE TEMPORARY TABLE actors_j
(
    actor_id smallint(5),
    first_name varchar(45),
    last_name varchar(45)
);

INSERT INTO actors_j
SELECT actor_id, first_name, last_name
FROM actor
WHERE last_name LIKE 'J%';

-- A view is a query that is stored in the data dictionary. It looks and acts like a table, but
-- there is no data associated with a view (this is why I call it a virtual table). When you
-- issue a query against a view, your query is merged with the view definition to create a
-- final query to be executed
CREATE VIEW cust_vw AS
SELECT customer_id, first_name, last_name, active
FROM customer;

-- When the view is created, no additional data is generated or stored: the server simply
-- tucks away the select statement for future use
SELECT first_name, last_name
FROM cust_vw
WHERE active = 0

-- if more than one table appears in the from
-- clause, the conditions used to link the tables must be included as well.
-- This is not a requirement of MySQL or any other database server, but
-- it is the ANSI-approved method of joining multiple tables, and it is the most portable
-- across the various database servers.
SELECT customer.first_name, customer.last_name,
time(rental.rental_date) rentaal_time 
FROM customer
INNER JOIN rental
ON customer.customer_id = rental.customer_id
WHERE date(rental.rental_date) = '2005-06-14';
-- The previous query displays data from both the 
-- customer table (first_name,last_name) and the 
-- rental table (rental_date), so both tables are 
-- included in the from clause.

-- The mechanism for linking the two tables (referred to as a join) is the
-- customer ID stored in both the  customer and rental tables. 
-- Thus, the database server is instructed to use the value of the 
-- customer_id column in the  customer table to find all of the customer’s rentals in the 
-- rental able.

-- Join conditions for the two tables are found in the on subclause of the
-- from clause; in this case, the join condition is 
-- ON customer.customer_id = rental.customer_id.
-- The where clause is not part of the join and is only included to keep the 
-- result set fairly small, since there are more than
-- 16,000 rows in the rental table.

SELECT c.first_name, c.last_name, time(r.rental_date) rental_time
FROM customer c
INNER JOIN  rental r
ON c.customer_id = r.customer_id
WHERE date(r.rental_date) = '2005-06-14';

-- Using as
SELECT c.first_name, c.last_name, time(r.rental_date) rental_time
FROM customer AS c
INNER JOIN rental AS r 
ON c.customer_id = r.customer_id
WHERE date(r.rental_date) = '2005-06-14';

SELECT title
FROM film
WHERE rating = 'G' AND rental_duration >= 7;

SELECT title FROM film
WHERE rating = 'G' OR rental_duration >= 7;

SELECT title, rating, rental_duration
FROM film
WHERE (rating = 'G' AND rental_duration >= 7) 
OR (rating = 'PG-13' AND rental_duration < 4) 

SELECT c.first_name, c.last_name, count(*)
FROM customer c
INNER JOIN rental r
ON c.customer_id = r.customer_id
GROUP BY c.first_name, c.last_name
HAVING COUNT(*) >= 40;


-- The order byclause is the mechanism for sorting your result set 
-- using either raw column data or expressions based on column data
SELECT c.first_name, c.last_name, time(r.rental_date) rental_time
FROM customer c
INNER JOIN rental r
ON c.customer_id = r.customer_id
WHERE date(r.rental_date) = '2005-06-14'
ORDER BY c.last_name

SELECT c.first_name, c.last_name, time(r.rental_date) rental_time
FROM customer c
INNER JOIN rental r
ON c.customer_id = r.customer_id
WHERE date(r.rental_date) = '2005-06-14'
ORDER BY c.last_name, c.first_name;
-- The order in which columns appear in your 
-- order by clause does make a difference
-- when you include more than one column.

SELECT c.first_name, c.last_name, time(r.rental_date)
from customer c
INNER JOIN rental r
ON c.customer_id = r.customer_id
WHERE date(r.rental_date) = '2005-06-14'
ORDER BY time(r.rental_date) desc;

-- Sorting via Numeric Placeholders
SELECT c.first_name, c.last_name,
time(r.rental_date) rental_time
FROM customer c
INNER JOIN rental r
ON c.customer_id = r.customer_id
WHERE date(r.rental_date) = '2005-06-14'
ORDER BY 3 desc;