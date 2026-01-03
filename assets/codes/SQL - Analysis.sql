/*
Define Variables
create CTE that rounds the average views per video
Select columns required for analysis
Filter result by Youtube channels with highest subscriber bases
Order by net_profit (Highest to Lowest)
*/

USE [youtube_db]
-- 1
DECLARE @coversionRate FLOAT = 0.02; -- conversion rate @ 2%
DECLARE @productCost MONEY = 5.0; -- product cost @ $5
DECLARE @campaignCost MONEY = 50000; -- campaign cost @ $50,000 CAD

--2
WITH ChannelData AS (
	SELECT
		[Channel_Name],
		[Total_Views],
		[Total_Videos],
		ROUND((CAST([Total_Views] as float)/[Total_Videos]), -4) AS Avg_Views_Per_Video
	FROM
		[dbo].[view_canada_youtube]
)

--3
SELECT
	[Channel_Name],
	(Avg_Views_Per_Video * @coversionRate) AS PotentialProductSalesPerVideo,
	(Avg_Views_Per_Video * @coversionRate * @productCost) AS PotentialRevenuePerVideo,
	((Avg_Views_Per_Video * @coversionRate * @productCost) - @campaignCost) AS NetProfit
FROM
	ChannelData

--4
WHERE
	Channel_Name IN ('Justin Bieber ','Super Simple Songs - Kids Songs ','The Weeknd ')

--5
ORDER BY
	NetProfit DESC
