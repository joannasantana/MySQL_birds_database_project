# Drop table statements for new tables
DROP TABLE IF EXISTS big_birds;
DROP TABLE IF EXISTS locations2;

# Creating a table for birds > 48 inches
CREATE TABLE big_birds AS
SELECT bird_id, bird_name, height, weight, wingspan
FROM birds
WHERE wingspan > 48;

# Creating a duplicate of the locations table
CREATE TABLE locations2 AS
SELECT *
FROM locations;

# Display new tables
SELECT *
FROM big_birds;

SELECT *
FROM locations2;

# Show table table/data structure
SHOW CREATE TABLE big_birds;

# Disable autocommit
SET autocommit = 0;

# Start a transaction 
START TRANSACTION;

# Change to column name from 'wingspan' to 'avg_wingspan'
ALTER TABLE big_birds
CHANGE wingspan avg_wingspan decimal(4,2);

# Display table change
SELECT *
FROM big_birds;

# Update the value of all birds' wingspans to the average wingspan
UPDATE big_birds
SET avg_wingspan = (
	SELECT avg(wingspan)
    FROM birds
	);
    
# Display table change
SELECT *
FROM big_birds;

# Create savepoint
SAVEPOINT savepoint1;

# Insert a new record into locations2 table
INSERT INTO locations2
VALUES (7, 'Lake Tahoe');

# Display changes
SELECT *
FROM locations2;

# Create savepoint
SAVEPOINT savepoint2;

# Rollback to savepoint1
ROLLBACK TO SAVEPOINT savepoint1;

# Display table. Note that all changes to big_birds table still exist bc they were made before savepoint1
SELECT *
FROM big_birds;

# Display table. Note that changes to locations2 table do not exist bc they were made after savepoint1
SELECT *
FROM locations2;

# Rollback entirely
ROLLBACK;

# Display table. Note that the column name is still avg_wingspan (rollbacks to not affect DDL commans such as ALTER TABLE) but the original wingspan values are back because it reversed all DML commands (UPDATE)
SELECT *
FROM big_birds;

# Once again, update the value of all birds' wingspans to the average wingspan
UPDATE big_birds
SET avg_wingspan = (
	SELECT avg(wingspan)
    FROM birds
	);
    
# Display table
SELECT *
FROM big_birds;

# Commit changes
COMMIT;

# Rollback entirely
ROLLBACK;

# Display table. Because transactions were committed this time, the rollback did not change the table back to showing individual wingspans
SELECT *
FROM big_birds;

# Enable autocommit
SET autocommit = 1;

# Display table
SELECT *
FROM locations2;

# Change location_name at location_id = 1 from 'Heron Lake' to 'Lake Superior'
UPDATE locations2
SET location_name = 'Lake Superior'
WHERE location_id = 1;

# Display table
SELECT *
FROM locations2;

# Rollback
ROLLBACK;

# Display table. Note that the rollback did not undo the change from 'Heron Lake' to 'Lake Superior' because autocommit was enabled
SELECT *
FROM locations2;