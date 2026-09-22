mysql -u username -p;
mysql -u username -p database_name;
desc table_name;
show tables; 
show databases;
use database_name
SHOW CHARACTER SET; # To view the supported character sets in your server
quit;
exit


mysql> desc person; 
+-------------+----------------------+------+-----+---------+-------+ 
| Field       | Type                 | Null | Key | Default | Extra | 
+-------------+----------------------+------+-----+---------+-------+ 
| person_id   | smallint(5) unsigned | NO   | PRI | NULL    |       | 
| fname       | varchar(20)          | YES  |     | NULL    |       | 
| lname       | varchar(20)          | YES  |     | NULL    |       | 
| eye_color   | enum('BR','BL','GR') | YES  |     | NULL    |       | 
| birth_date  | date                 | YES  |     | NULL    |       | 
| street      | varchar(30)          | YES  |     | NULL    |       | 
| city        | varchar(20)          | YES  |     | NULL    |       | 
| state       | varchar(20)          | YES  |     | NULL    |       | 
| country     | varchar(20)          | YES  |     | NULL    |       | 
| postal_code | varchar(20)          | YES  |     | NULL    |       | 
+-------------+----------------------+------+-----+---------+-------+ 

# Columns 1 and 2 of the describe output are self-explanatory. 

# Column 3 shows whether a particular column can be omitted when data is inserted into the table.

# The fourth column shows whether a column takes part in any keys (primary or foreign); in this case, 
# the person_id column is marked as the primary key. 

# Column 5 shows whether a particular column will be
# populated with a default value if you omit the column when inserting data into the table.

# The sixth column (called “Extra”) shows any other pertinent information that might
# apply to a column.
