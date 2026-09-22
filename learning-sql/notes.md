======================================================================================================================
                                       Introduction to Databases
======================================================================================================================
``MySQL 8.4``LTS is Oracle's current recommended target for anyone upgrading off 8.0. It's the long-term-support line going forward, so this is what new production deployments and 8.0 migrations are being pointed toward.
```MariaDB``` - it's a fork created in 2009 by MySQL's original founder specifically to guarantee a version stays fully open with no Oracle involvement.

A database is nothing more than a set of related information. A telephone book, for
example, is a database of the names, phone numbers, and addresses of all people living
in a particular region.

SQL schema statements, which are used to define the data structures
stored in the database;

SQL data statements, which are used to manipulate the data
structures previously defined using SQL schema statements; 

SQL transaction statements, which are used to begin, end, and roll back transaction

metadata, data about the database

======================================================================================================================
                                             MySQL Data Types
======================================================================================================================
In general, all the popular database servers have the capacity to store the same types of
data, such as strings, dates, and numbers. Where they typically differ is in the specialty
data types, such as XML and JSON documents or spatial data.

## Character Data
Character data can be stored as either fixed-length or variable-length strings; the
difference is that fixed-length strings are right-padded with spaces and always consume
the same number of bytes, and variable-length strings are not right-padded with spaces
and don’t always consume the same number of bytes. When defining a character column,
you must specify the maximum size of any string to be stored in the column. For
example, if you want to store strings up to 20 characters in length, you could use either
of the following definitions:
```char(20)    /* fixed-length */ ```
```varchar(20) /* variable-length */```


The maximum length for char columns is currently 255 bytes, whereas varchar
columns can be up to 65,535 bytes. 

If you need to store longer strings (such as emails, XML documents, etc.), then you will want to use one of the text types (mediumtext and longtext)

In general, you should use the ```char``` type when all strings to be stored in the column are of the ```same length,```
such as state abbreviations, and the ``varchar`` type when strings to be stored in the column are of
``varying lengths``. Both char and varchar are used in a similar fashion in all the major
database servers.

## Character sets
For languages that use the Latin alphabet, such as English, there is a sufficiently small
number of characters such that only a single byte is needed to store each character.
Other languages, such as Japanese and Korean, contain large numbers of characters,
thus requiring multiple bytes of storage for each character. Such character sets are
therefore called multibyte character sets.

To choose a character set other than the default when defining a column, simply name one of the
supported character sets after the type definition, as in:
```varchar(20) character set latin1```


With MySQL, you may also set the default character set for your entire database:
```create database european_sales character set latin1;```

## Text data
If you need to store data that might exceed the 64 KB limit for varchar columns, you
will need to use one of the text types.
Table 2-1 shows the available text types and their maximum sizes.
Text type Maximum number of bytes
+------------+---------------+
| Type       | Max length    |
+------------+---------------+
| tinytext   | 255           |
| text       | 65,535        |
| mediumtext | 16,777,215    |
| longtext   | 4,294,967,295 |
+------------+---------------+

When choosing to use one of the text types, you should be aware of the following:
  1. If the data being loaded into a text column exceeds the maximum size for that
     type, the data will be truncated.
  2. Trailing spaces will not be removed when data is loaded into the column.
  3. Now that MySQL allows up to 65,535 bytes for varchar columns (it was limited 
     to 255 bytes in version 4), there isn’t any particular need to use the tinytext or text type.

If you are creating a column for free-form data entry, such as a notes column to hold
data about customer interactions with your company’s customer service department,
then varchar will probably be adequate. If you are storing documents, however, you
should choose either the mediumtext or longtext type.

## Numeric Data
Although it might seem reasonable to have a single numeric data type called “numeric,”
there are actually several different numeric data types that reflect the various ways in
which numbers are used, as illustrated here:

```A column indicating whether a customer order has been shipped``
This type of column, referred to as a Boolean, would contain a 0 to indicate false
and a 1 to indicate true.

```A system-generated primary key for a transaction table```
This data would generally start at 1 and increase in increments of one up to a
potentially very large number.

```An item number for a customer’s electronic shopping basket```
The values for this type of column would be positive whole numbers between 1 and,
perhaps, 200 (for shopaholics).
Positional data for a circuit board drill machine
High-precision scientific or manufacturing data often requires accuracy to eight
decimal points.

To handle these types of data (and more), MySQL has several different numeric data
types. The most commonly used numeric types are those used to store ``whole numbers, or integers.``
 When specifying one of these types, you may also specify that the data is
``unsigned``, which tells the server that all data stored in the column will be greater than or
equal to zero.

Table 2-2. MySQL integer types
Type Signed range Unsigned range
+-----------+---------------------------------+----------------------+
| Type      | Signed range                    | Unsigned range       |
+-----------+---------------------------------+----------------------+
| tinyint   | -128 to 127                     | 0 to 255             |
| smallint  | -32,768 to 32,767               | 0 to 65,535          |
| mediumint | -8,388,608 to 8,388,607         | 0 to 16,777,215      |
| int       | -2,147,483,648 to 2,147,483,647 | 0 to 4,294,967,295   |
| bigint    | -2^63 to 2^63 - 1               | 0 to 2^64 - 1        |
+-----------+---------------------------------+----------------------+

When you create a column using one of the integer types, MySQL will allocate an
appropriate amount of space to store the data, which ranges from one byte for a
tinyint to eight bytes for a bigint. Therefore, you should try to choose a type that
will be large enough to hold the biggest number you can envision being stored in the
column without needlessly wasting storage space.
For floating-point numbers (such as 3.1415927), you may choose from the numeric
types shown in Table 2-3.


able 2-3. MySQL floating-point types
Type Numeric range
+---------------+-------------------------------------------------------+
| Type          | Range                                                 |
+---------------+-------------------------------------------------------+
| float(p, s)   | -3.402823466E+38 to -1.175494351E-38                  |
|               | and 1.175494351E-38 to 3.402823466E+38                |
+---------------+-------------------------------------------------------+
| double(p, s)  | -1.7976931348623157E+308 to -2.2250738585072014E-308   |
|               | and 2.2250738585072014E-308 to 1.7976931348623157E+308 |
+---------------+---------------------------------------------------------+
When using a floating-point type, you can specify a precision (the total number of
allowable digits both to the left and to the right of the decimal point) and a scale (the
number of allowable digits to the right of the decimal point), but they are not required.

These values are represented in Table 2-3 as p and s. If you specify a precision and
scale for your floating-point column, remember that the data stored in the column will
be rounded if the number of digits exceeds the scale and/or precision of the column. 

For example, a column defined as float(4,2) will store a total of four digits, two to the
left of the decimal and two to the right of the decimal. Therefore, such a column would
handle the numbers 27.44 and 8.19 just fine, but the number 17.8675 would be rounded
to 17.87, and attempting to store the number 178.375 in your float(4,2) column
would generate an error.


## Temporal Data
Along with strings and numbers, you will almost certainly be working with information
about dates and/or times. This type of data is referred to as temporal, and some
examples of temporal data in a database include:
  1. The future date that a particular event is expected to happen, such as shipping a customer’s order
  2. The date that a customer’s order was shipped
  3. The date and time that a user modified a particular row in a table
  4. An employee’s birth date
  5. The year corresponding to a row in a yearly_sales fact table in a data warehouse

The elapsed time needed to complete a wiring harness on an automobile
assembly line MySQL includes data types to handle all of these situations. 

Table 2-4 shows the temporal data types supported by MySQL
Table 2-4. MySQL temporal types

+-----------+------------------+-----------------------------------------------+
| Type      | Default format   | Allowable values                              |
+-----------+------------------+-----------------------------------------------+
| date      | YYYY-MM-DD       | 1000-01-01 to 9999-12-31                      |
+-----------+------------------+-----------------------------------------------+
| datetime  | YYYY-MM-DD       | 1000-01-01 00:00:00.000000                    |
|           | HH:MI:SS         | to 9999-12-31 23:59:59.999999                 |
+-----------+------------------+-----------------------------------------------+
| timestamp | YYYY-MM-DD       | 1970-01-01 00:00:00.000000                    |
|           | HH:MI:SS         | to 2038-01-18 22:14:07.999999                 |
+-----------+------------------+-----------------------------------------------+
| year      | YYYY             | 1901 to 2155                                  |
+-----------+------------------+-----------------------------------------------+
| time      | HHH:MI:SS        | -838:59:59.000000                             |
|           |                  | to 838:59:59.000000                           |
+-----------+------------------+-----------------------------------------------+

While database servers store temporal data in various ways, the purpose of a format
string (second column of Table 2-4) is to show how the data will be represented when
retrieved, along with how a ``date string`` should be constructed when inserting or updating
a temporal column. 

Thus, if you wanted to insert the date March 23, 2020, into a date
column using the default format ``YYYY-MM-DD``, you would use the string ``2020-03-23'``.
Chapter 7 fully explores how temporal data is constructed and displayed.



Here’s how the various temporal types would be used to implement the examples shown
earlier:

1. Columns to hold the expected future shipping date of a customer order and an
   employee’s birth date would use the ``date type``, since it is unrealistic to
   schedule a future shipment down to the second and unnecessary to know at
   what time a person was born.

2. A column to hold information about when a customer order was actually
   shipped would use the ``datetime type``, since it is important to track not only the
   date that the shipment occurred but the time as well.

3. A column that tracks when a user last modified a particular row in a table
   would use the ``timestamp type``. The timestamp type holds the same
   information as the datetime type ``(year, month, day, hour, minute, second)``, but
   a timestamp column will automatically be populated with the current
   date/time by the MySQL server when a row is added to a table or when a row
   is later modified.

4. A column holding just year data would use the ``year type.``

5. Columns that hold data regarding the length of time needed to complete a task
   would use the ``time type.`` For this type of data, it would be unnecessary and
   confusing to store a date component, since you are interested only in the
   number of hours/minutes/seconds needed to complete the task. 
   This information could be derived using two datetime columns (one for the task start date/time
   and the other for the task completion date/time) and subtracting one from the
   other, but it is simpler to use a single time colum