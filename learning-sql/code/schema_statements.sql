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

-- The favorite_food table contains another type of constraint which is called a
-- foreign key constraint. This constrains the values of the  person_id column in 
-- the favorite_food table to include only values found in the person table.

-- With this constraint in place, I will not be able to add a row to the
-- favorite_food table indicating that person_id 27 likes pizza if there isn’t
-- already a row in the person table having a person_id of 27

-- If you forget to create the foreign key constraint when you first create the table,
-- you can add it later via the  alter table statement.
CREATE TABLE favorite_food(
    person_id SMALLINT UNSIGNED,
    food VARCHAR(20),
    CONSTRAINT pk_favorite_food PRIMARY KEY (person_id, food),
    CONSTRAINT fk_fav_food_person_id FOREIGN KEY (person_id) REFERENCES person(person_id)
);