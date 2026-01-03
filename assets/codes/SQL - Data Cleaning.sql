-- activating new database created for project
use youtube_db;

--checking imported excel file
select * from [dbo].[youtube_data_canada]

-- removing unnecessary columns 
Select
	[NAME],
	[Total_Subscriber],
	[Total_Views],
	[Total_Videos]
from
	[dbo].[youtube_data_canada]

-- CHARINDEX
SELECT CHARINDEX('@', [NAME]), [NAME] FROM [dbo].[youtube_data_canada]

-- SUBSTRING & CREATING VIEW FOR POWER BI
CREATE VIEW view_canada_youtube as 

SELECT 
	CAST(SUBSTRING([NAME], 1, CHARINDEX('@',[NAME])-1) AS varchar(100)) as 'Channel_Name',
	[Total_Subscriber],
	[Total_Views],
	[Total_Videos]
FROM
	[dbo].[youtube_data_canada]