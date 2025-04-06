# Chapter 4 Exercises

# How many unique birds are in the database? 23

# What foods does the Bald Eagle eat? Fish, carrion, ducks

# Who builds the most nests, male or female, or both? Female

# How many birds migrate to Central America? 12

# Which bird spends the most time raising its young? Mute swan, 190 days

# Which birds have the term 'eagle' in their nickname? Bald Eagle, Golden Eagle

# What is the most puoular migration location for birds in the database? Southern United States

# Which bird(s) has/have the most diverse diet? American Crow, Golden Eagle

# What is the average wingspan of birds that eat fish? 52.35 inches

# Which photographers have mentors that are younger than them? Older?


# CHAPTER 12 QUESTIONS. PAGE 188
# How many types of birds are in the database?
SELECT COUNT(*)
FROM birds;

# Which bird has the most diverse diet?

# Which is the largest bird?

# Which birds have a wingspan greater than average?

# In which species of birds do both males and females contribute to building the nest?

# List all birds in order of thier size

# Which bird spends the most total time with its young?

# What percentage of birds eat fish?

# Which birds are "big" (subjective)?

##################################
# SELECT, FROM, WHERE, operators #
##################################
# What are the classifications for nest_builder
SELECT DISTINCT nest_builder
FROM birds;

# MySQL data is not case sensitive
SELECT bird_name
FROM birds
WHERE bird_name = 'bald eagle';

# Display table
SELECT *
FROM birds;

# Which birds have more than two broods per year?
SELECT bird_name
FROM birds
WHERE broods > 2;

# Show all records in the migration table where the migration_location is not Mexico
SELECT *
FROM migration
WHERE migration_location <> 'Mexico';

# List all birds that have a wingspan less than 48 inches
SELECT bird_name
FROM birds
WHERE wingspan > 48;

# List all birds that have a wingspan greater than or equal to 72 inches
SELECT bird_name
FROM birds
WHERE wingspan >= 72;

# Return the bird_name and wingspan of birds that have a wingspan between 30 and 70 inches. Order by largest wingspan to smallest
SELECT bird_name, wingspan
FROM birds
WHERE wingspan BETWEEN 30 AND 70
ORDER BY wingspan DESC;

# Select all migration locations that are in Central America and South America
SELECT *
FROM migration
WHERE migration_location IN ('Central America', 'South America');

# List all birds that have the word 'green' in their name
SELECT bird_name
FROM birds
WHERE bird_name LIKE '%green%';

# List all birds that begin with the word 'bald'
SELECT bird_name
FROM birds
WHERE bird_name LIKE 'bald%';

# Do any birds have a weight more than 5 pounds and a height shorter than 36 inches?
SELECT bird_name, weight, height
FROM birds
WHERE weight > 5 AND height < 36;

# List all bird names that do not have the word 'green' in their name
SELECT bird_name
FROM birds
WHERE bird_name NOT LIKE '%green%';

# List all bird names that have one of the three primary colors in their name
SELECT bird_name
FROM birds
WHERE bird_name LIKE '%red%'
	OR bird_name LIKE '%blue%'
    OR bird_name LIKE '%yellow%';
    
# How many birds spend more than 75 days total with their young
SELECT COUNT(*)
FROM birds
WHERE incubation + fledging > 75;

########
# JOIN #
########
# Combine the birds table with the nicknames table using the WHERE statement. Only include birds with nicknames. Return the bird_id, bird_name, and nickname and order by bird_id
SELECT b.bird_id, bird_name, nickname
FROM birds b, nicknames n
WHERE b.bird_id = n.bird_id
ORDER BY bird_id; # can also say ORDER BY 1 since bird_id is the first column in the SELECT statement

# Combine the birds table with the nicknames table using the JOIN statement. Only include birds with nicknames. Return the bird_id, bird_name, and nickname
SELECT b.bird_id, bird_name, nickname
FROM birds b
JOIN nicknames n ON b.bird_id = n.bird_id
ORDER BY bird_id; # can also say ORDER BY 1 since bird_id is the first column in the SELECT statement;

# Combine the birds table with the nicknames table using the JOIN statement. Include birds without nicknames. Return the bird_id, bird_name, and nickname
SELECT b.bird_id, bird_name, nickname
FROM birds b
LEFT JOIN nicknames n ON b.bird_id = n.bird_id
ORDER BY bird_id; # can also say ORDER BY 1 since bird_id is the first column in the SELECT statement;

# Display photographers table
SELECT *
FROM photographers;

# Using the WHERE statement, combine the photographers data to itself to produce a list of paired mentors and mentees
SELECT mentors.photographer_name mentor, mentees.photographer_name mentee
FROM photographers mentors, photographers mentees
WHERE mentors.photographer_id = mentees.mentor_id
ORDER BY 1;

# Using the JOIN statement, self join photographers data to itself to produce a list of paired mentors and mentees
SELECT mentors.photographer_name mentor, mentees.photographer_name mentee
FROM photographers mentors
JOIN photographers mentees ON mentors.photographer_id = mentees.mentor_id
ORDER BY 1;

# Use the WHERE statement to show all the possible mentor/mentee combinations
SELECT mentors.photographer_name mentor, mentees.photographer_name mentee
FROM photographers mentors, photographers mentees
WHERE mentors.photographer_name <> mentees.photographer_name
ORDER BY 1;

# Use a CROSS JOIN to show all the possible mentor/mentee combinations
SELECT mentors.photographer_name mentor, mentees.photographer_name mentee
FROM photographers mentors
CROSS JOIN photographers mentees
WHERE mentors.photographer_name <> mentees.photographer_name
ORDER BY 1;

# Use the WHERE statement to show all the possible bird/food combinations
SELECT bird_name, food_name
FROM birds, food
ORDER BY 1;

# Use the CROSS JOIN statement to show all the possible bird/food combinations
SELECT bird_name, food_name
FROM birds
CROSS JOIN food
ORDER BY 1;

# Use the WHERE statement to show the foods each bird eats
SELECT bird_name, food_name
FROM birds b, food f, birds_food bf
WHERE b.bird_id = bf.bird_id
	AND f.food_id = bf.food_id
ORDER BY 1;

# Use the JOIN statement to show the foods each bird eats
SELECT bird_name, food_name
FROM birds b
JOIN birds_food bf ON b.bird_id = bf.bird_id
JOIN food f ON f.food_id = bf.food_id
ORDER BY 1;

# Use WHERE statement to show how many different foods each bird eats
SELECT bird_name, COUNT(bird_name)
FROM birds b, birds_food bf
WHERE b.bird_id = bf.bird_id
GROUP BY bird_name
ORDER BY 1;

# Use JOIN statement to show how many different foods each bird eats. Make sure that you show all birds, regardless of if we know what they eat.
SELECT bird_name, COUNT(bird_name)
FROM birds b
LEFT JOIN birds_food bf ON b.bird_id = bf.bird_id
GROUP BY bird_name
ORDER BY 1;

# Write statemtns about the max and min weights of birds in the dataset. Round up/down to the nearest integer.
SELECT CONCAT_WS(' ', 'Birds in this dataset weigh up to', CEILING(MAX(weight)), 'pounds')
FROM birds;

SELECT CONCAT_WS(' ', 'Birds in this dataset weigh more than', FLOOR(MIN(weight)), 'pounds')
FROM birds;

##################
# DATE FUNCTIONS #
##################
# Calculate how old photographers are
SELECT photographer_name, dob, FLOOR(DATEDIFF(NOW(), dob)/365) AS age
FROM photographers;

# When did each photographer celebrate their 18th birthday?
SELECT photographer_name, dob, DATE_ADD(dob, INTERVAL 18 YEAR)
FROM photographers;

# At what age did each photographer submit their first photo?
SELECT photographer_name, dob, date_first_photo, FLOOR(DATEDIFF(date_first_photo, dob)/365) AS age_first_photo
FROM photographers;

# Which photographer started taking photos at the youngest age?
# At what age did each photographer submit their first photo?
SELECT photographer_name, dob, date_first_photo, FLOOR(DATEDIFF(date_first_photo, dob)/365) AS age_first_photo
FROM photographers
ORDER BY age_first_photo
LIMIT 1;

# Present the date each photographer submitted thier first photo in string format and include the day of the week
SELECT photographer_name, DATE_FORMAT(date_first_photo, '%W %M %D %Y') AS career_started
FROM photographers;

# Display the day of the week each photographer was born
SELECT photographer_name, DATE_FORMAT(dob, '%W') AS weekday_of_birth
FROM photographers;

# Which photographer has been taking photos the longest?
SELECT photographer_name, DATEDIFF(NOW(), date_first_photo)/365 AS years_working
FROM photographers
ORDER BY years_working DESC
LIMIT 1;

# Were any photographers born on the same day of the week?
SELECT photographer_name, DATE_FORMAT(dob, '%W') AS weekday_of_birth
FROM photographers
ORDER BY weekday_of_birth;

# Which is the most common day of the week that photographers submitted their first photo?
SELECT DAYNAME(date_first_photo) AS day_career_began, COUNT(*) as total_photographers
FROM photographers
GROUP BY DAYNAME(date_first_photo)
ORDER BY total_photographers DESC
;

# What days of the week (if any) has nobody submitted thier very first photo?
SELECT day_of_week
FROM (
	SELECT 'Sunday' AS day_of_week
    UNION
    SELECT 'Monday'
    UNION
    SELECT 'Tuesday'
    UNION
    SELECT 'Wednesday'
    UNION
    SELECT 'Thursday'
    UNION
    SELECT 'Friday'
    UNION
    SELECT 'Saturday'
) AS all_weekdays
WHERE day_of_week NOT IN (
	SELECT DISTINCT DAYNAME(date_first_photo)
	FROM photographers
);

# Which photographers might have started taking photos because of a New Year's resolution?
SELECT photographer_name, date_first_photo
FROM photographers
WHERE date_first_photo LIKE '%01-01';

###################################
# aggregate funtions and GROUP BY #
###################################

# How many photographers have mentors?
SELECT COUNT(mentor_id)
FROM photographers;

# How many unique mentors are there?
SELECT COUNT(DISTINCT mentor_id)
FROM photographers;

# What is the total number of eggs produced per season?
SELECT SUM(eggs * broods) as total_eggs_per_season
FROM birds;

# What is the average wingspan of all birds in the database?
SELECT AVG(wingspan)
FROM birds;

# What is the maximum wingspan of all birds in the database?
SELECT MAX(wingspan)
FROM birds;

# What is the maximum wingspan of all birds in the database?
SELECT MIN(wingspan)
FROM birds;

# Return the number of birds that migrate to each location
SELECT m.migration_location, COUNT(bm.bird_id) AS no_birds
FROM migration m, birds_migration bm
WHERE m.migration_id = bm.migration_id
GROUP BY m.migration_location;

# For each food, what is the average wingspan of the birds that eat it?
SELECT f.food_name, ROUND(AVG(b.wingspan),0) as bird_wingspan
FROM food f, birds_food bf, birds b
WHERE f.food_id = bf.food_id
AND bf.bird_id = b.bird_id
GROUP BY f.food_name
ORDER BY bird_wingspan DESC;

# What is the average number of eggs laid per season for each migration location?
SELECT m.migration_location, FLOOR(AVG(b.eggs * b.broods)) AS avg_eggs_per_season
FROM migration m, birds b, birds_migration bm
WHERE m.migration_id = bm.migration_id
AND bm.bird_id = b.bird_id
GROUP BY m.migration_location
ORDER BY avg_eggs_per_season DESC;

# What is the average wingspan of birds for each migration location? Use rollup to compare it to the average wingspan for this entire grouping of data.
# The average reported by the ROLLUP is not the same as the average of wingspans of unique birds in the birds table. This is because this group of data counts some birds more than once because they migrate to multiple locations.
SELECT m.migration_location, AVG(b.wingspan) AS avg_wingspan
FROM migration m, birds b, birds_migration bm
WHERE m.migration_id = bm.migration_id
AND b.bird_id = bm.bird_id
GROUP BY migration_location WITH ROLLUP;

# For each food, what is the average wingspan of the birds that eat it? Only include results if the average wingspan is > 50.
SELECT f.food_name, ROUND(AVG(b.wingspan),0) as bird_wingspan
FROM food f, birds_food bf, birds b
WHERE f.food_id = bf.food_id
AND bf.bird_id = b.bird_id
GROUP BY f.food_name
HAVING ROUND(AVG(b.wingspan),0) > 50
ORDER BY bird_wingspan DESC;

# What is the averag wingspan of birds?
SELECT AVG(wingspan)
FROM birds;

# What is the average wingspan of birds that eat fish?
SELECT AVG(wingspan)
FROM birds b, birds_food bf, food f
WHERE b.bird_id = bf.bird_id
AND bf.food_id = f.food_id
AND food_name = 'Fish'
;

# How many different types of food does the Common Loon eat?
SELECT bird_name, COUNT(food_id) as no_foods_eaten
FROM birds b, birds_food bf
WHERE b.bird_id = bf.bird_id
AND bird_name = 'Common Loon';

# What is the average number of eggs per type of nest?
SELECT nest_builder, ROUND(AVG(eggs),0)
FROM birds
GROUP BY nest_builder;

# What is the lightest bird?
SELECT bird_name, weight
FROM birds
WHERE weight = (
	SELECT MIN(weight)
	FROM birds
);


# Generate a list of birds that are above average in all the following areas: height, weight, and wingspan
SELECT bird_name
FROM birds
WHERE weight > (
	SELECT AVG(weight)
	FROM birds
)
AND height > (
	SELECT AVG(height)
	FROM birds
)
AND wingspan > (
	SELECT AVG(wingspan)
	FROM birds
);

# Show a list of all photographers and the number of photographers mentored by each photographer
SELECT p.photographer_name mentor, COUNT(mentees.mentor_id) as no_mentees
FROM photographers p
LEFT JOIN photographers mentees ON p.photographer_id = mentees.mentor_id
GROUP BY mentor
ORDER BY 2;

# Using a subquery and an embedded subquery, return all birds that migrate to Mexico and eat fish
SELECT bird_name
FROM birds
WHERE bird_id IN
	(SELECT bird_id
	FROM birds_migration bm, migration m
	WHERE bm.migration_id = m.migration_id
	AND m.migration_location = 'Mexico'
AND bird_id IN
	(SELECT bird_id
	FROM birds_food bf, food f
	WHERE bf.food_id = f.food_id
	AND f.food_name = 'Fish')
	);
    
# Using a correllated subquery, return only birds and their associated wingspan if they have a nickname containing 'eagle'
SELECT bird_name, wingspan
FROM birds b
WHERE bird_id IN
	(SELECT bird_id
    FROM nicknames n
    WHERE b.bird_id = n.bird_id
    AND n.nickname LIKE '%eagle%');

# Write a query with a subquery to create a list of birds and their wingspans for birds that have a wingspan less than the average wingspan in the birds table
SELECT bird_id, bird_name, wingspan
FROM birds
WHERE wingspan <
	(SELECT AVG(wingspan)
    FROM birds
    );
    


# Produce a list of birds and their associated migration locations for only birds that migrate to locations that have birds migrating there with an above average wingspan.
SELECT bird_name, migration_location
FROM birds b, migration m, birds_migration bm
WHERE b.bird_id = bm.bird_id
AND bm.migration_id = m.migration_id
AND wingspan > 
	(SELECT AVG(wingspan)
	FROM birds);
    
# Use a subquery to find any food items that are eaten by the shortest bird in the database
SELECT food_name
FROM food
WHERE food_id IN
	(SELECT food_id
    FROM birds_food bf, birds b
    WHERE bf.bird_id = b.bird_id
    AND height =
		(SELECT MIN(height)
        FROM birds)
    );
