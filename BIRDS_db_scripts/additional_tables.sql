# Drop the tables if they already exist. 
DROP TABLE IF EXISTS camera_sensors;
DROP TABLE IF EXISTS photographer_cameras;
DROP TABLE IF EXISTS cameras;
DROP TABLE IF EXISTS photographers;

# Creating photographers table
CREATE TABLE photographers (
Photographer_Id SMALLINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
Photographer_Name VARCHAR(50) NOT NULL,
Contact_Info VARCHAR(50),
Education VARCHAR(100),
Website VARCHAR(100),
Mentor_ID SMALLINT
);

# Creating photographer_cameras table
CREATE TABLE photographer_cameras (
Photographer_Id SMALLINT NOT NULL,
Camera_Id SMALLINT NOT NULL,
CONSTRAINT photographer_cameras_pk PRIMARY KEY (Photographer_Id, Camera_Id),
CONSTRAINT photographer_cameras_fk FOREIGN KEY (Photographer_Id) REFERENCES photographers (Photographer_Id)
);

# Creating cameras table
CREATE TABLE cameras (
Camera_Id SMALLINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
Camera_Make VARCHAR(50),
Camera_Model VARCHAR(50),
Sensor_Id SMALLINT,
Megapixels SMALLINT,
Frames_Per_Second SMALLINT,
ISO_Range SMALLINT,
Cost DECIMAL(6,2)
);

# Modifying photographers to add the foreign key relating Mentor_Id to Photographer_Id
ALTER TABLE photographers
ADD CONSTRAINT photographers_fk1 FOREIGN KEY (Mentor_ID) REFERENCES photographers (Photographer_Id)
;

# Modifying photographer_cameras to add the foreign key relating Camera_Id to the primary key in the cameras table
ALTER TABLE photographer_cameras
ADD CONSTRAINT photographer_cameras_fk2 FOREIGN KEY (Camera_Id) REFERENCES cameras (Camera_Id)
;

# Checking to make sure the photographer_cameras table updated
SHOW CREATE TABLE photographer_cameras
;

# Creating the camera_sensors table
CREATE TABLE camera_sensors (
Sensor_Id SMALLINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
Sensor_Type VARCHAR(50),
Description VARCHAR(300)
);

# Modifying the cameras table to add the foreign key relating Sensor_Id to the primary key in the camera_sensors table
ALTER TABLE cameras
ADD CONSTRAINT cameras_fk FOREIGN KEY (Sensor_Id) REFERENCES camera_sensors (Sensor_Id)
;

# Checking to make sure the cameras table updated
SHOW CREATE TABLE cameras
;

# Using subqueries, create a table of birds with above average height, weight, and wingspan
CREATE TABLE above_avg_birds AS
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

# Applying the concept of a subquery, create a new table called bird_appetizers base on the following: this new table should list the food_id and food_name, but only for food items associated with birds that are in the bottom 25 percentile of height
CREATE TABLE bird_appetizers AS
SELECT food_id, food_name
FROM food
WHERE food_id in
	(SELECT food_id
    FROM birds_food bf, birds b
    WHERE bf.bird_id = b.bird_id
    AND height <=
    (SELECT MAX(height)*0.25
    FROM birds));

SELECT * FROM bird_appetizers;