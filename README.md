# Repository of the Czech Top YouTubers (2024)
This workflow outlines the process of downloading, processing, analyzing and visualizing data from YouTube channels using Python, SQL and Power BI/Tableau. 
By leveraging the YouTube API, Pandas for data manipulation, SQL for data cleaning and organization, and Power BI/Tableau for analyse and visualization, you can effectively manage and analyze YouTube channel data.

Overview:

1. Data source:
  Download the CSV file (source_czech_rep_youtube.csv) containing information about various Czech YouTube channels.

2. Data update with Pandas (Python):
  Retrieve YouTube channel statistics (such as the number of subscribers, views, and videos) for each YouTube channel, and save the results in a new CSV file (updated_czech_rep_youtube.csv).
  The Python code for retrieving data via the YouTube API is provided in the Jupyter notebook (youtube_api.ipynb). Instructions for creating an API key to access YouTube data are available in the template.env file.
   
4. SQL Data Cleaning:
  Import the updated data into Microsoft SQL Server for further cleaning and standardization. Create a view to enable easier access to necessary columns. The SQL code is available in the SQLQuery_Youtube.sql file.
  Export the final cleaned data as final_czech_rep_youtube.csv.

5. Create Power BI dashboard:
  Use the cleaned data (either by directly accessing the pre-created SQL view or by importing the final final_czech_rep_youtube.csv file) to build visualizations and dashboards in Power BI or Tableau for further analysis.

Note: You can view an image of the dashboard (TopYouTubers_CZ2024_DashboardImage.png) or download the Power BI or Tableau file with the original dashboard (Power BI: TopYoutubers_CZ2024_PowerBIdashboard.pbix or Tableau: TopYouTubers_CZ2024_TableauDashboard.twb).
