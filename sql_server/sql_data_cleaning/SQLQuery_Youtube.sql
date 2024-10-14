
-- 1. USE SQL OR OBJECT EXPLORER TO CREATE DATABASE
-- CREATE DATABASE social_media_db;

USE social_media_db;

-- SELECT all data to check
SELECT *
  FROM social_media_db..TopCzechYoutubers2024;

/*
CLEANING DATA PROCESS

STEPS TO DO:
1. Remove Duplicates - we don´t need to, because we know we don´t have any
2. Standardize the Data - extract the Youtube channel names from column called "NAME" and Rename the column names
3. Null Values or blank Values - We already know we are not going to use columns with null values
4. Remove unnecessary columns - We remove unnecessary columns by creating special view (with columns we need)

*/

--Standardize the Data and remove unnecessary columns in 1 step
------------------------
-- A. extract the Youtube channel names from NAME using CHARINDEX (in mySQL LOCATE) and SUBSTRING OR LEFT functions (in mySQL is SUBSTRING and LEFT as well)
-- and change column names and data type (Name) to NVARCHAR to be able to include all characters (Czech, Russian, etc) 
SELECT
CAST(LEFT(NAME, CHARINDEX('@', NAME)-1) AS NVARCHAR(100)) AS Name 
FROM social_media_db..TopCzechYoutubers2024;
-- second example
--SELECT SUBSTRING(NAME, 1, CHARINDEX('@', NAME)-1) AS Name, total_subscribers AS Total_Subscribers, total_views AS Total_Views, total_videos AS Total_Videos,
--Engagement_Rate,  Monthly_Views, Monthly_Subscriber_Growth, Absolute_Monthly_Subscriber_Growth
--FROM top_czech_rep_youtubers_2024;

-- B. create view to select columns needed
DROP VIEW IF EXISTS ViewTopCzechYoutubers2024;

CREATE VIEW ViewTopCzechYoutubers2024 AS
SELECT 
	CAST(LEFT(NAME, CHARINDEX('@', NAME)-1) AS NVARCHAR(100)) AS Channel_Name, 
	total_subscribers AS Total_Subscribers, 
	total_views AS Total_Views, 
	total_videos AS Total_Videos,
	Engagement_Rate
FROM social_media_db..TopCzechYoutubers2024;

SELECT * FROM social_media_db..ViewTopCzechYoutubers2024;

/*
QUALITY DATA CHECK:

STEPS TO DO:
1.	The data needs 100 rows of records of Youtube channels - row count check
	EXPECTATION: 100
2.	The data needs 5 fields (Channel_Name, Total_Subscribers, Total_Views, Total_Videos and Engagement_Rate) - column count and name check
	EXPECTATION: 5
3. The data needs to be in specific format - data type check
	EXPECTED DATA TYPE:
	Channel_name - string, 
	Total_Subscribers - numeric, 
	Total_Views - numeric,
	Total_Videos - numeric,
	Engagement_Rate - float/numeric
4. The data needs to be unique - each record (each row) - duplicate count check
	EXPECTATION = 0
*/
--RESULTS:
-- to be sure we are still in right database
USE social_media_db;
---------------------------------------------------------------------------------------------------------
-- 1 row count check - 100 rows - OK (PASSED!)

SELECT COUNT(1) FROM social_media_db..ViewTopCzechYoutubers2024;
---------------------------------------------------------------------------------------------------------
-- 2A column count check - 5 fields - OK (PASSED!)

SELECT 
	COUNT(1) AS ColumnCount 
FROM 
	INFORMATION_SCHEMA.COLUMNS
WHERE 
	TABLE_NAME = 'ViewTopCzechYoutubers2024';

-- 2B column names check: Channel_Name, Total_Subscribers, Total_Views, Total_Videos and Engagement_Rate - All names OK (PASSED!)

SELECT 
	COLUMN_NAME AS ColumnName 
FROM 
	INFORMATION_SCHEMA.COLUMNS
WHERE 
	TABLE_NAME = 'ViewTopCzechYoutubers2024';
---------------------------------------------------------------------------------------------------------
-- 3 data type check - 5 fields - OK, Channel_Name = strings and all the others are numeric, (PASSED!)

SELECT 
	COLUMN_NAME ColumnName, DATA_TYPE DataType 
FROM 
	INFORMATION_SCHEMA.COLUMNS
WHERE 
	TABLE_NAME = 'ViewTopCzechYoutubers2024';
---------------------------------------------------------------------------------------------------------
-- 4 duplicate count check - OK, no duplicates (PASSED!)
SELECT 
	Channel_Name,
	COUNT(1) AS Channel_count
FROM 
	social_media_db..ViewTopCzechYoutubers2024
GROUP BY 
	Channel_Name
HAVING 
	COUNT(1) > 1;

-- Final check of the final table
SELECT * FROM social_media_db..ViewTopCzechYoutubers2024;