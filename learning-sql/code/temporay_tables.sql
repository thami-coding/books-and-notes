-- every relational database allows the ability to define volatile,
-- or temporary, tables.
-- These tables look just like permanent tables, but any data inserted into 
-- a temporary table will disappear at some point(generally at the end of a 
-- transaction or when your database session is closed)

CREATE TEMPORARY TABLE actors_j (
    actor_id smallint(5),
    first_name varchar(45),
    last_name varchar(45)
);

INSERT INTO actors_j
SELECT actor_id, first_name, last_name
FROM actor
WHERE last_name LIKE 'J%';

SELECT * FROM actors_j;
-- +----------+------------+-----------+ 
-- | actor_id | first_name | last_name | 
-- +----------+------------+-----------+ 
-- |      119 | WARREN     | JACKMAN   | 

-- These seven rows are held in memory temporarily and will disappear after your session
-- is closed.
-- Most database servers also drop the temporary table when the session ends.