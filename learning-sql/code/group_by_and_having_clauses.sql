-- Sometimes,however, you will want to find trends in your data that will require the database server
-- to cook the data a bit before you retrieve your result set.
-- One such mechanism is the group by clause, which is used to group data by column values.

-- For example, let’s say you wanted to find all of the customers who have rented 40 or more films.
-- Rather than looking through all 16,044 rows in the rental table, you can write a query that instructs
-- the server to group all rentals by customer, count the number of rentals for each customer, and then
-- return only those customers whose rental count is at least 40.

-- When using the group by clause to generate groups of rows, you may also use the having clause,
-- which allows you to filter grouped data in the same way the where clause lets you filter raw data.

SELECT c.first_name, c.last_name, count(*)
FROM customer c
INNER JOIN rental r
ON c.customer_id = r.customer_id
GROUP BY c.first_name, c.last_name
HAVING COUNT(*) >= 40;
-- +------------+-----------+----------+
-- | first_name | last_name | count(*) |
-- +------------+-----------+----------+
-- | TAMMY      | SANDERS   |       41 |
-- | CLARA      | SHAW      |       42 |
-- | ELEANOR    | HUNT      |       46 |
-- | SUE        | PETERS    |       40 |
-- | MARCIA     | DEAN      |       42 |
-- | WESLEY     | BULL      |       40 |
-- | KARL       | SEAL      |       45 |