SELECT * FROM birds;

# CONCAT function
SELECT CONCAT(bird_id, '-', bird_name)
FROM birds;

# CONCAT_WS function
SELECT CONCAT_WS('-', bird_id, bird_name, broods)
FROM birds;

SELECT CONCAT_WS(' ', 'Another name for', b.bird_name, 'is:', n.nickname) AS nickname_statement
FROM birds b
JOIN nicknames n ON b.bird_id = n.bird_id;

SELECT CONCAT_WS(' ', 'The', b.bird_name, 'eats', f.food_name) AS diet
FROM birds b
JOIN birds_food bf ON b.bird_id = bf.bird_id
JOIN food f ON bf.food_id = f.food_id;

# SUBSTRING function
SELECT location_name, SUBSTRING(UPPER(location_name), 1, 3) as location_code
FROM locations;

# REPLACE function
SELECT migration_location, REPLACE(migration_location, ' ', '-')
FROM migration;

SELECT migration_location, REPLACE(migration_location, 'United States', 'USA')
FROM migration;

SELECT bird_name, REPLACE(bird_name, 'Heron', '') AS type
FROM birds
WHERE bird_name LIKE '%Heron%';

# SUBSTRING_INDEX function
SELECT bird_name, SUBSTRING_INDEX(bird_name, SUBSTRING_INDEX(bird_name, 'Heron', 1), -1) as bird, SUBSTRING_INDEX(bird_name, 'Heron', 1) as type
FROM birds
WHERE bird_name LIKE '%Heron%';

# COALESCE function
# Using the JOIN statement, self join photographers data to itself to produce a list of paired mentors and mentees. If a photographer has no mentor, assign them 'Self Taught' in the mentors column
SELECT mentees.photographer_name mentee, COALESCE(mentors.photographer_name, 'Self Taught') mentor
FROM photographers mentors
RIGHT JOIN photographers mentees ON mentors.photographer_id = mentees.mentor_id
ORDER BY 1;

# LPAD AND RPAD funtions
SELECT migration_location, LPAD(migration_location, 25, '.') AS left_padded_location
FROM migration;

SELECT migration_location, RPAD(migration_location, 25, '.') AS left_padded_location
FROM migration;




