/*
1) Define the variables 
2) Create CTEs (Avg Views per Video)
3) Filter the results by top 10 Youtube Channels with highest count of uploaded Video
4) Select necessary columns for the analysis
5) Order result bys net profit (from highest to lowest)
*/

USE social_media_db;

-- 1) Variables (can be created by declaration or using a temporary table)
-- DECLARE @conversionRate FLOAT = 0.02;			-- the conversion rate @ 2%
-- DECLARE @productCost MONEY = 200.0;				-- the product cost @ 200 Kč
-- DECLARE @campaignCostPerVideo MONEY = 50000.0;	-- the campaign cost per Video @ 50,000 Kč
-- DECLARE @campaignNumberOfVideos INT = 10;		-- the campaign number of videos @ 10

-- Create temp table #Variables and insert all variables
DROP TABLE IF EXISTS #Variables;
CREATE TABLE #Variables(
	conversionRate FLOAT,
	productCost MONEY,
	campaignCostPerVideo MONEY,
	campaignNumberOfVideos INT
);
INSERT INTO #Variables(conversionRate, productCost, campaignCostPerVideo, campaignNumberOfVideos)
VALUES(0.02, 200.0, 50000.0, 10);
-- SELECT * FROM #Variables;

-- 2) Create CTEs (Avg Views per Video)

WITH ViewsVideoCTE AS
(SELECT 
-- 3)  Filter the CTE by top 10 Youtube Channels with highest count of uploaded Video
	TOP 10 Total_Videos,
	Channel_Name, 
	ROUND(CAST(Total_Views/Total_Videos AS FLOAT), -4) AS ViewsPerVideo
FROM 
	ViewTopCzechYoutubers2024
ORDER BY Total_Videos DESC
)
-- 3) Select necessary columns for the analysis
SELECT 
	Channel_Name,
	ViewsPerVideo,
	(ViewsPerVideo * v.conversionRate) AS PotentialProductSalesPerVideo,
	(ViewsPerVideo * v.conversionRate * productCost) AS PotentialRevenuePerVideo,
	(ViewsPerVideo * v.conversionRate * productCost)-(campaignCostPerVideo*campaignNumberOfVideos) AS NetProfit
FROM ViewsVideoCTE
-- JOIN all used variables from temp table #Variables
JOIN #Variables AS v ON 1 = 1 
-- 5) Order result by net profit (from highest to lowest)
ORDER BY NetProfit DESC, Channel_Name ASC;

-- TOP 3 
-- Channel Name				Views/Video		Pot.Prod.SalesPerVideo	Pot.RevenuePerVideo		NetProfit
-- MenT						300000			6000					1200000					700000
-- Alexander Zakshevsky		140000			2800					560000					60000
-- Godzu					130000			2600					520000					20000
-- PedrosGame				130000			2600					520000					20000