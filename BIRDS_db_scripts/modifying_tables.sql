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