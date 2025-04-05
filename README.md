# MySQL Birds Database Project

Using MySQL, a database storing information about birds was created. Information available for querying includes photos, locations, nicknames, food, migration locations, and nesting habits.

Data source: https://www.ryansql.com/sample-db-sql-scripts

tables.sql and data.sql
- Oracle code to create the tables was provided.
- Original code edits to make it compatible with MySQL.

additional_table_photography.sql
- Original code demonstrating Data Definition Language (DDL)
- Adds the following 4 tables to the database
    - photographers 
    - photographer_cameras
    - cameras 
    - camera_sensors

modifying_tables.sql
- Original code demonstrating Data Definition Language (DDL).
- Adds a photographer_id column to the photos table as a foreign key the new Photographers table.
- Adds dob and date_first_photo columns to the photographers table.

data_manipulation.sql
- Original code demonstrating Data Modifying Language (DML).
- photographers table was updated
    - Table was altered to change a column name.
    - New records were inserted.
    - Demonstrated how NULL assignments will result in actual data when AUTO_INCREMENT is enabled.
- tall_birds table created
    - Records include birdsbirds with wingspan over 70 inches.
    - The data in this table was manipulated using INSERT INTO, UPDATE, and DELETE. 
    - Demonstrated the consequences of not using a WHERE clause during updating and deleting.

managing_transactions.sql
- Original code demonstrating how to manage transactions in MySQL by disabling autocommit mode and using savepoints, rollbacks, and commits. 
- Highlights how transactional control only affects DML not DDL.
- Adds two new tables (big_birds, locations2) to the database to use solely for transactional control demonstration.

DQL_exercises.sql
- A series of data querying demonstrating filtering, operators, joins, date functions, aggregate functions, grouping with rollup, etc

restructuring_data.sql
- Original code demonstrating how to create or alter strings using concatination, replacing characters, trimming and padding, and using coalesce to replace null values.

