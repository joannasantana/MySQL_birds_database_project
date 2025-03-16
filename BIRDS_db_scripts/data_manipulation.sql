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