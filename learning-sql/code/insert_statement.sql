-- You are not required to provide data for every column in the table (unless all the
-- columns in the table have been defined as not null). 
-- In some cases, those columns that are not included in the initial 
-- insert statement will be given a value later via an
-- update statement.

-- There are three main components to an inser statement:
-- 1. The name of the table into which to add the data
-- 2. The names of the columns in the table to be populated
-- 3. The values with which to populate the columns

INSERT INTO person (
    person_id,
    fname,
    lname,
    eye_color,
    birth_date
)
VALUES (
        null,
        'William',
        'Turner',
        'BR',
        '1972-05-27'
    );
    
-- couple of things about the earlier insert statement are worth mentioning
-- The value provided for the birth_date column was a string. As long as you
-- match the required format shown in Table 2-4, MySQL will convert the string to 
-- a date for you.

-- The column names and the values provided must correspond in number and
-- type. If you name seven columns and provide only six values or if you provide
-- values that cannot be converted to the appropriate data type for the
-- corresponding column, you will receive an error.