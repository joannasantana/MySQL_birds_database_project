# Modify photos table to add the photographer ID, which will reference the primary key in the photographers table
ALTER TABLE photos
ADD photographer_id SMALLINT,
ADD CONSTRAINT photos_photographer_id FOREIGN KEY (photographer_id) REFERENCES photographers (Photographer_Id)
;

# Confirm new column for photos table
SHOW CREATE TABLE photos;

# Show photos table
SELECT *
FROM photos
LIMIT 5
;

# Add a column to the photographers table that shows the photographers birthdate
SELECT *
FROM photographers;

ALTER TABLE photographers
ADD dob DATE;

UPDATE photographers
SET dob ='1989-01-29'
WHERE Photographer_Id = 1;

UPDATE photographers
SET dob ='1990-01-01'
WHERE Photographer_Id = 2;

UPDATE photographers
SET dob = '1975-07-16'
WHERE Photographer_Id = 3;

UPDATE photographers
SET dob = '1979-12-03'
WHERE Photographer_Id = 4;

UPDATE photographers
SET dob = '1982-01-31'
WHERE Photographer_Id = 5;

UPDATE photographers
SET dob = '2005-02-24'
WHERE Photographer_Id = 6;

UPDATE photographers
SET dob ='1963-08-15'
WHERE Photographer_Id = 7;

UPDATE photographers
SET dob = '1969-09-14'
WHERE Photographer_Id = 8;

UPDATE photographers
SET dob = '1985-03-22'
WHERE Photographer_Id = 9;

UPDATE photographers
SET dob = '2001-01-25'
WHERE Photographer_Id = 10;

UPDATE photographers
SET dob = '1971-09-14'
WHERE Photographer_Id = 11;

UPDATE photographers
SET dob = '1969-09-14'
WHERE Photographer_Id = 12;

# Add a column to the photographers table that shows when the photographer submitted thieir first photo
SELECT *
FROM photographers;

ALTER TABLE photographers
ADD date_first_photo DATE;

UPDATE photographers
SET date_first_photo ='2009-01-29'
WHERE Photographer_Id = 1;

UPDATE photographers
SET date_first_photo ='2005-01-01'
WHERE Photographer_Id = 2;

UPDATE photographers
SET date_first_photo = '1989-07-16'
WHERE Photographer_Id = 3;

UPDATE photographers
SET date_first_photo = '2016-02-22'
WHERE Photographer_Id = 4;

UPDATE photographers
SET date_first_photo = '2000-12-25'
WHERE Photographer_Id = 5;

UPDATE photographers
SET date_first_photo = '2019-01-01'
WHERE Photographer_Id = 6;

UPDATE photographers
SET date_first_photo ='1983-08-16'
WHERE Photographer_Id = 7;

UPDATE photographers
SET date_first_photo = '2000-01-01'
WHERE Photographer_Id = 8;

UPDATE photographers
SET date_first_photo = '2011-05-16'
WHERE Photographer_Id = 9;

UPDATE photographers
SET date_first_photo = '2019-02-01'
WHERE Photographer_Id = 10;

UPDATE photographers
SET date_first_photo = '2010-10-10'
WHERE Photographer_Id = 11;

UPDATE photographers
SET date_first_photo = '1976-11-07'
WHERE Photographer_Id = 12;