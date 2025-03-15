# birds_db_sql

Using MySQL, a database storing information about birds was created. Information available for querying includes photos, locations, nicknames, food, migration locations, and nesting habits.

Data source: https://www.ryansql.com/sample-db-sql-scripts

tables.sql and data.sql
- Oracle code to create the tables was provided
- Original code edits to make it compliant with MySQL

additional_table_photographers.sql
- Original code that adds the following 4 tables to the database
    - Photographers 
    - Photographer_Cameras
    - Cameras 
    - Camera_Sensors

modifying_tables.sql
- Original code that adds a photographer_id column to the photos table and references the new Photographers table
