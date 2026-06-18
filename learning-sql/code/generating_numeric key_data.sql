-- it would be useful to discuss how values are generated for numeric primary keys. 
-- Other than picking a number out of thin air, you have a couple of options:
-- 1. Look at the largest value currently in the table and add one.
-- 2. Let the database server provide the value for you.

ALTER TABLE person MODIFY person_id SMALLINT UNSIGNED AUTO_INCREMENT;
