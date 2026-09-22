CREATE TABLE corporation (
    corp_id SMALLINT,
    name VARCHAR(30),
    CONSTRAINT pk_corporation PRIMARY KEY (corp_id)
);

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

-- MySQL allows a check constraint to be attached to a column definition, as in
-- the following:
eye_color CHAR(2) CHECK (eye_color IN ('BR','BL','GR')),

-- when you define your table, you need to tell the database server what column or
-- columns will serve as the primary key for the table. You do this by creating a constraint
-- on the table. You can add several types of constraints to a table definition. This
-- constraint is a primary key constraint. 
-- It is created on the person_id column and given the name pk_person.

-- normalization is - the process of ensuring that there are no duplicate (other than foreign keys)
-- or compound columns in your database design.