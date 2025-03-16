# MySQL Birds Database Project

Using MySQL, a database storing information about birds was created. Information available for querying includes photos, locations, nicknames, food, migration locations, and nesting habits.

Data source: https://www.ryansql.com/sample-db-sql-scripts

tables.sql and data.sql
- Oracle code to create the tables was provided.
- Original code edits to make it compatible with MySQL.

additional_table_photographers.sql
- Original code that adds the following 4 tables to the database
    - photographers 
    - photographer_cameras
    - cameras 
    - camera_sensors

modifying_tables.sql
- Original code that adds a photographer_id column to the photos table and references the new Photographers table

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


