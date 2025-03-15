# Drop the tables if they already exist. The order presented takes into account parent/child relationships and ensures that they can be dropped 
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