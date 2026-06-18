-- You can achievethis by adding the keyword  distinct directly after
-- the select keyword, as demonstrated by the following:
SELECT DISTINCT actor_id FROM film_actor ORDER BY actor_id;

-- Keep in mind that generating a distinct set of results requires the data to be sorted, 
-- which can be time consuming for large result sets. Don’t fall into the trap of using 
-- distinct just to be sure there are no duplicates