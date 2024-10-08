# Repository of the Czech Top YouTubers (2024)
This workflow outlines the process of downloading, processing, analyzing and visualizing data from YouTube channels using Python, SQL and Power BI/Tableau. 
By leveraging the YouTube API, Pandas for data manipulation, SQL for data cleaning and organization, and Power BI/Tableau for analyse and visualization, you can effectively manage and analyze YouTube channel data.

Overview:

1. Data source:
  - Download the CSV file with rankings: 
    source_czech_rep_youtube_ranking.csv.
  - Download the CSV file with engagement statistics: 
    source_czech_rep_youtube_engagement_rate.csv.

2. Data update with Pandas (Python):
  - Retrieve YouTube channel statistics (such as subscribers, views, videos, and engagement rate) for each channel.
  - Save the updated data in updated_czech_rep_youtube.csv.
  -Python code for retrieving data via the YouTube API is provided in the Jupyter notebook: youtube_api.ipynb.
  - Instructions for creating a YouTube API key are provided in template.env.
   
4. SQL Data Cleaning:
  - Import the updated CSV into Microsoft SQL Server for cleaning and standardization.
  - Create a view to simplify access to key columns.
  - SQL queries are available in SQLQuery_Youtube.sql.
  - Export the final cleaned data as final_czech_rep_youtube.csv.

5. Create Power BI/Tableau dashboard:
  - Use the cleaned data (from the SQL view or final_czech_rep_youtube.csv) to build visualizations and dashboards.
  - Create your dashboard in Power BI or Tableau for in-depth analysis.


Note: 

  - You can view an image of the dashboard:
        TopYouTubers_CZ2024_DashboardImage.png
    
  - Download the original dashboard files:
        Power BI: TopYoutubers_CZ2024_PowerBidashboard.pbix
        Tableau: TopYouTubers_CZ2024_TableauDashboard.twb
