SELECT * FROM migration;

# Change migration location of migration_id=5 from "No Significant Migration" to "None"
UPDATE migration
SET migration_location = 'None'
WHERE migration_id = 5
;

SELECT * FROM photographers;

# Change the Mentor_ID column name to Mentor_Id
ALTER TABLE photographers
CHANGE Mentor_ID Mentor_Id SMALLINT;

# Add the first two records into the photographers table. Since Photograher_Id was set up to autoincrement, NULL can be assigned.
INSERT INTO photographers 
VALUES 
(NULL, 'Joanna Santana', 'joanna@photosbyjoanna.com', NULL, 'photosbyjoanna.com', NULL),
(NULL, 'John Doe', 'john@goodphotosfast.com', 'BA in Digital Media', 'goodphotosfast.com', NULL)
;

SELECT * FROM photographers;

# Update John Doe's record to show that he was mentored by Joanna Santana
UPDATE photographers
SET Mentor_Id = 1
WHERE Photographer_Id = 2
;

SELECT * FROM photographers;

# Insert more records into the photographers table
INSERT INTO photographers
	(Photographer_ID, Photographer_Name, Mentor_Id)
VALUES 
	(NULL, 'Ryan Notstephens', NULL),
    (NULL, 'Susan Williamson', NULL),
    (NULL, 'Mark Fife', NULL),
    (NULL, 'Shooter McGavin', NULL),
    (NULL, 'Jenny Forest', 8),
    (NULL, 'Steve Hamm', NULL),
    (NULL, 'Harry Henderson', 2),
    (NULL, 'Kelly Hairtrigger', 8),
    (NULL, 'Gordon Flash', NULL),
    (NULL, 'Kate Kapteur', 7);

# Create a table called short_birds using data from the birds table
DROP TABLE IF EXISTS short_birds;

CREATE TABLE short_birds (
Bird_Id SMALLINT NOT NULL PRIMARY KEY,
Bird_Name VARCHAR(30) NOT NULL,
Height TINYINT
);

INSERT INTO short_birds
SELECT bird_id, bird_name, height
FROM birds
WHERE height <20
;

SELECT * FROM short_birds;

# Update multiple columns for bird_id = 8
UPDATE short_birds
SET
bird_name = 'Kingfisher',
height = 12
WHERE bird_id = 8
;

SELECT * FROM short_birds;

# Delete the record of the American Coot
DELETE FROM short_birds
WHERE bird_id = 11
;

SELECT * FROM short_birds;

# Create a table called tall_birds using data from the birds table
DROP TABLE IF EXISTS tall_birds;

CREATE TABLE tall_birds (
Bird_Id SMALLINT PRIMARY KEY NOT NULL,
Bird_Name VARCHAR(30) NOT NULL,
Wingspan TINYINT
);

INSERT INTO tall_birds
SELECT bird_id, bird_name, wingspan
FROM birds
WHERE wingspan >30
;

SELECT * FROM tall_birds;

INSERT INTO tall_birds
VALUES
(24, 'Great Egret', 66)
;

SELECT * FROM tall_birds;

# Update a bird's name to be 'Big Bird' if their wingspan is over 70 inches
UPDATE tall_birds
SET Bird_Name = 'Big Bird'
WHERE wingspan > 70
;

SELECT * FROM tall_birds;

# Not using a WHERE clause will cause all values to be updated in the specified column
UPDATE tall_birds
SET wingspan = NULL
;

SELECT * FROM tall_birds;

# Not using the WHERE clause will cause all values to be deleted
DELETE FROM tall_birds;

SELECT * FROM tall_birds;

# Truncate the above_avg_birds table to remove any existing data
TRUNCATE TABLE above_avg_birds;

SELECT *
FROM above_avg_birds;

# Using subqueries, insert rows into the above_avg_birds table of birds with above average height, weight, and wingspan
INSERT INTO above_avg_birds
SELECT bird_id, bird_name, wingspan, height, weight
FROM birds
WHERE wingspan >
	(SELECT AVG(wingspan)
	FROM birds)
AND height >
	(SELECT AVG(height)
	FROM birds)
AND weight >
	(SELECT AVG(weight)
	FROM birds);
    
SELECT *
FROM above_avg_birds;

# Using subqueries, update rows of the above_avg_birds table 
UPDATE above_avg_birds
SET wingspan = 99, height = 99, weight = 99
WHERE wingspan >
	(SELECT AVG(wingspan)
	FROM birds)
AND height >
	(SELECT AVG(height)
	FROM birds)
AND weight >
	(SELECT AVG(weight)
	FROM birds);
    
SELECT *
FROM above_avg_birds;

# Using subqueries, delete rows of data for any birds that have either a wingspan equal to the max wingspan or a height that is exactly the same as the max height for any bird in the table
DELETE FROM above_avg_birds
WHERE wingspan =
	(SELECT MAX(wingspan)
	FROM birds)
OR height =
	(SELECT MAX(height)
	FROM birds);
    
