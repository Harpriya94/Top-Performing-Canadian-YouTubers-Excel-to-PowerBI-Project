/*

##Data quality checks ##MOST IMPORTANT

a)	Row count test (at least 100 records required) --PASSED
b)	Column count test (at least 4 columns required) --PASSED
c)	Datatype check (Channel name must be string and other columns should be whole numbers) --PASSED
d)	Duplicate check (each record must be unique) -- PASSED

*/

-- Row Count Check
SELECT 
	COUNT(*) AS No_of_rows
FROM 
	[dbo].[view_canada_youtube]

-- Column Count Check
SELECT 
	COUNT(*) AS No_of_cols 
FROM 
	INFORMATION_SCHEMA.COLUMNS
WHERE 
	TABLE_NAME = 'view_canada_youtube'

-- Datatype Check
SELECT 
	COLUMN_NAME, DATA_TYPE
FROM 
	INFORMATION_SCHEMA.COLUMNS
WHERE 
	TABLE_NAME = 'view_canada_youtube'

-- Duplicate Check
SELECT 
	[Channel_Name],
	COUNT(*) AS duplicate_count
FROM 
	[dbo].[view_canada_youtube]
GROUP BY
	Channel_Name
HAVING
	COUNT(*) > 1

--Another method to check duplicate
SELECT 
	COUNT(DISTINCT [Channel_Name]) 
FROM 
	[dbo].[view_canada_youtube]