-- A view is a query that is stored in the data dictionary. It looks and acts like a table, but
-- there is no data associated with a view (this is why I call it a virtual table). When you
-- issue a query against a view, your query is merged with the view definition to create a
-- final query to be executed.

-- To demonstrate, here’s a view definition that queries the 
-- employeetable and includes four of the available columns:
CREATE VIEW cust_vw AS 
SELECT customer_id, first_name, last_name, active 
FROM customer;

-- When the view is created, no additional data is generated or stored: the server simply
-- tucks away the select statement for future use. Now that the view exists, you can issue
-- queries against it, as in:
SELECT first_name, last_name FROM cust_vw WHERE active = 0;
-- +------------+-----------+ 
-- | first_name | last_name | 
-- +------------+-----------+ 
-- | SANDRA     | MARTIN    | 
-- | JUDITH     | COX       | 
-- | SHEILA     | WELLS     | 
-- | ERICA      | MATTHEWS  | 
-- | HEIDI      | LARSON    | 
-- | PENNY      | NEAL      | 
-- | KENNETH    | GOODEN    | 
-- | HARRY      | ARCE      | 
-- | NATHAN     | RUNYON    | 
-- | THEODORE   | CULP      | 
-- | MAURICE    | CRAWLEY   | 
-- | BEN        | EASTER    | 
-- | CHRISTIAN  | JUNG      | 
-- | JIMMIE     | EGGLESTON | 
-- | TERRANCE   | ROUSH     | 
-- +------------+-----------+ 

-- Views are created for various reasons, including to hide columns from users and to
-- simplify complex database designs.