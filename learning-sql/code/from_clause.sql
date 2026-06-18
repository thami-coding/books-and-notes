-- Although most SQL books define the  from clause as simply a list
-- of one or more tables, I would like to broaden the definition as follows:
-- The from clause defines the tables used by a query, along with the means of linking
-- the tables together.

-- table - a set of related rows stored in a database.

-- While this does describe one type of table, I would like to use the word
-- in a more general way by removing any notion of how the data might be stored and
-- concentrating on just the set of related rows. 

-- Four different types of tables meet this relaxed definition:
-- 1. Permanent tables (i.e., created using the create table statement)
-- 2. Derived tables (i.e., rows returned by a subquery and held in memory)
-- 3. Temporary tables (i.e., volatile data held in memory)
-- 4. Virtual tables (i.e., created using the create view statement)

-- Each of these table types may be included in a query’s from clause.