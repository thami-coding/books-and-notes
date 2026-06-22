-- The where clause is the mechanism for filtering out unwanted rows from your result set.
-- Depending on the conditions in your where clause,it is also possible 
-- to modify more than one row using a single statement

-- example:
-- WHERE person_id < 10

-- For example, perhaps you are interested in renting a film but you are only interested in
-- movies rated G that can be kept for at least a week. The following query employs a
-- where clause to retrieve only the films meeting these criteria:
SELECT title 
FROM film
WHERE rating = 'G' AND rental_duration >= 7;

-- +-------------------------+ 
-- | title                   |
-- +-------------------------+
-- | BLANKET BEVERLY         | 
-- | BORROWERS BEDAZZLED     | 
-- | BRIDE INTRIGUE          | 
-- | CATCH AMISTAD           | 
-- | CITIZEN SHREK           | 
-- | COLDBLOODED DARLING     | 
-- | CONTROL ANTHEM          | 
-- | CRUELTY UNFORGIVEN      | 
-- | DARN FORRESTER          | 
-- | DESPERATE TRAINSPOTTING | 
-- | DIARY PANIC             | 
-- | DRACULA CRYSTAL         | 
-- | EMPIRE MALKOVICH        | 
-- | FIREHOUSE VIETNAM       | 
-- | GILBERT PELICAN         | 
-- | GRADUATE LORD           | 
-- | GREASE YOUTH            | 
-- | GUN BONNIE              | 
-- | HOOK CHARIOTS           | 
-- | MARRIED GO              | 
-- | MENAGERIE RUSHMORE      | 
-- | MUSCLE BRIGHT           | 
-- | OPERATION OPERATION     | 
-- | PRIMARY GLASS           | 
-- | REBEL AIRPORT           | 
-- | SPIKING ELEMENT         | 
-- | TRUMAN CRAZY            | 
-- | WAKE JAWS               | 
-- | WAR NOTTING             | 
-- +-------------------------+ 

-- This where clause contains two filter conditions, but you can include as many conditions as 
-- are required; individual conditions are separated using operators such as and , or , and not

SELECT title
FROM film
WHERE rating = 'G' OR rental_duration >= 7;



SELECT title
FROM film
WHERE rating = 'G' OR rental_duration >= 7;

-- When you separate conditions using the and operator, all conditions must evaluate
-- to true to be included in the result set; when you use or , however, only one of the
-- conditions needs to evaluate to true for a row to be included, which explains why the
-- size of the result set has jumped from 29 to 340 rows.


-- So, what should you do if you need to use both and and or operators in your where clause? 
-- Glad you asked. You should use parentheses to group conditions together

-- The next query specifies that only those films that are rated G and are available for 7 or more days,
--  or are rated PG-13 and are available 3 or fewer days, be included in the result set:
SELECT title, rating, rental_duration
FROM film
WHERE (rating = 'G' AND rental_duration >= 7) 
OR (rating = 'PG-13' AND rental_duration <= 4);

-- +-------------------------+--------+-----------------+ 
-- | title                   | rating | rental_duration | 
-- +-------------------------+--------+-----------------+ 
-- | ALABAMA DEVIL           | PG-13  |               3 | 
-- | BACKLASH UNDEFEATED     | PG-13  |               3 | 
-- | BILKO ANONYMOUS         | PG-13  |               3 | 
-- | BLANKET BEVERLY         | G      |               7 | 
-- | BORROWERS BEDAZZLED     | G      |               7 | 
-- | BRIDE INTRIGUE          | G      |               7 | 
-- | CASPER DRAGONFLY        | PG-13  |               3 | 
-- | CATCH AMISTAD           | G      |               7 | 
-- | CITIZEN SHREK           | G      |               7 | 
-- | COLDBLOODED DARLING     | G      |               7 | 
-- |...                                                 | 
-- | TREASURE COMMAND        | PG-13  |               3 | 
-- | TRUMAN CRAZY            | G      |               7 |
-- | WAIT CIDER              | PG-13  |               3 | 
-- | WAKE JAWS               | G      |               7 | 
-- | WAR NOTTING             | G      |               7 | 
-- | WORLD LEATHERNECKS      | PG-13  |               3 | 
-- +-------------------------+--------+-----------------+

-- You should always use parentheses to separate groups of conditions when mixing
-- different operators so that you, the database server, and anyone who comes along later
-- to modify your code will be on the same page.