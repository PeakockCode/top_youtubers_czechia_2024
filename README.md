# Repository of the Czech Top YouTubers (2024)
This workflow outlines the process of downloading, processing, analyzing and visualizing data from YouTube channels using Python, SQL and Power BI/Tableau. 
By leveraging the YouTube API, Pandas for data manipulation, SQL for data cleaning and organization, and Power BI/Tableau for analyse and visualization, you can effectively manage and analyze YouTube channel data.

Overview:

1. Data source:
  Download the CSV file (source_czech_rep_youtube.csv) containing information about various Czech YouTube channels.

2. Data update with Pandas (Python):
  Retrieve YouTube channel statistics (number of subscribers, views, and videos) for each YouTube channel and save them in a new CSV file (updated_czech_rep_youtube.csv).
   
4. SQL Data Cleaning:
  Import the updated data into Microsoft SQL Server for further cleaning and standardization. Create a view for easier access to the necessary columns. Export the final file as 'final_czech_rep_youtube.csv'.

5. Create Power BI dashboard:
  Use the cleaned data (you can either access the pre-created view directly from Power BI/Tableau or import the final file 'final_czech_rep_youtube.csv') to create visualizations and dashboards in Power BI/Tableau for further analysis.

Note: You can view an image of the dashboard (Top_YouTubers_CZ_2024-Dashboard_Image_Overview.png) or download the Power BI/Tableau file with the original dashboard (Power BI: TopYoutubersCZ2024_PowerBI_dashboard.pbix or Tableau: TopYouTubersCZ2024_Tableau_dashboard.twb).
