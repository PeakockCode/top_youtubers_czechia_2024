/*
1) Define the variables 
2) Create CTEs (Avg Views per Video)
3) Filter the results by top 10 Youtube Channels with the highest count of Views
4) Select necessary columns for the analysis
5) Order result bys net profit (from highest to lowest)
*/

USE social_media_db;

-- 1) Variables (can be created by declaration or using a temporary table)
-- DECLARE @conversionRate FLOAT = 0.02;			-- the conversion rate @ 2%
-- DECLARE @productCost MONEY = 200.0;				-- the product cost @ 200 Kč
-- DECLARE @campaignCost MONEY = 960000.0;	-- the campaign cost @  960000.0 Kč

-- Create temp table #Variables and insert all variables
DROP TABLE IF EXISTS #Variables;
CREATE TABLE #Variables(
	conversionRate FLOAT,
	productCost MONEY,
	campaignCost MONEY,
);
INSERT INTO #Variables(conversionRate, productCost, campaignCost)
VALUES(0.02, 200.0, 960000.0);
-- SELECT * FROM #Variables;

-- 2) Create CTEs (Avg Views per Video)

WITH ViewsVideoCTE AS
(SELECT 
-- 3)  Filter the CTE by top 10 Youtube Channels with highest count of uploaded Video
	TOP 10 Total_Views,
	Channel_Name, 
	ROUND(CAST(Total_Views/Total_Videos AS FLOAT), -4) AS ViewsPerVideo
FROM 
	ViewTopCzechYoutubers2024
ORDER BY Total_Views DESC
)
-- 3) Select necessary columns for the analysis
SELECT 
	Channel_Name AS ChannelName,
	ViewsPerVideo,
	(ViewsPerVideo * v.conversionRate) AS PotentialProductSalesPerVideo,
	(ViewsPerVideo * v.conversionRate * productCost) AS PotentialRevenuePerVideo,
	(ViewsPerVideo * v.conversionRate * productCost)-(campaignCost) AS NetProfit
FROM ViewsVideoCTE
-- JOIN all used variables from temp table #Variables
JOIN #Variables AS v ON 1 = 1 
-- 5) Order result by net profit (from highest to lowest)
ORDER BY NetProfit DESC, Channel_Name ASC;

-- TOP 3 
-- Channel Name			Views/Video		Pot.Prod.SalesPerVideo	Pot.RevenuePerVideo		NetProfit
-- ViralBrothers SHOW		6660000			133200			26640000			25680000
-- Štístko a Poupěnka		3760000			75200			15040000			14080000
-- Puzzle guy			1750000			35000			7000000				6040000
