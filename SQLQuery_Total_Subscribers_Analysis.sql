/*
1) Define the variables 
2) Create CTEs (Avg Views per Video)
3) Filter the results by top 10 Youtube Channels with highest subscriber count
4) Select necessary columns for the analysis
5) Order result bys net profit (from highest to lowest)
*/

USE social_media_db;

-- 1) Variables (can be created by declaration or using a temporary table)
-- DECLARE @conversionRate FLOAT = 0.02;		-- the conversion rate @ 2%
-- DECLARE @productCost MONEY = 200.0;			-- the product cost @ 200 Kč
-- DECLARE @campaignCost MONEY = 1250000.0;		-- the campaign cost @ 1,250,000 Kč

-- Create temp table #Variables and insert all variables
DROP TABLE IF EXISTS #Variables;
CREATE TABLE #Variables(
	conversionRate FLOAT,
	productCost MONEY,
	campaignCost MONEY
);
INSERT INTO #Variables(conversionRate, productCost, campaignCost)
VALUES(0.02, 200.0, 1250000.0);
-- SELECT * FROM #Variables;

-- 2) Create CTEs (Avg Views per Video)

-- We will use the already prepared view
SELECT * FROM ViewTopCzechYoutubers2024;

WITH ViewsVideoCTE AS
(SELECT 
-- 3)  Filter the CTE by top 10 Youtube Channels with highest subscriber base
	TOP 10 Total_Subscribers,
	Channel_Name, 
	ROUND(CAST(Total_Views/Total_Videos AS FLOAT), -4) AS ViewsPerVideo
FROM 
	ViewTopCzechYoutubers2024
ORDER BY Total_Subscribers DESC
)
-- 3) Select necessary columns for the analysis
SELECT 
	Channel_Name,
	ViewsPerVideo,
	(ViewsPerVideo * v.conversionRate) AS PotentialProductSalesPerVideo,
	(ViewsPerVideo * v.conversionRate * productCost) AS PotentialRevenuePerVideo,
	(ViewsPerVideo * v.conversionRate * productCost)-campaignCost AS NetProfit
FROM ViewsVideoCTE
-- JOIN all used variables from temp table #Variables
JOIN #Variables AS v ON 1 = 1 
-- 5) Order result by net profit (from highest to lowest)
ORDER BY NetProfit DESC;

-- TOP 3 
-- Silvie Mahdal	3520000	70400	14080000	12830000
-- Puzzle guy	1770000	35400	7080000	5830000
-- FIZIstyle	1500000	30000	6000000	4750000