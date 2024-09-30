# Repository of the Czech Top YouTubers (09/2024)
This workflow outlines the process of downloading, processing, and analyzing data from YouTube channels using Python and SQL. 
By leveraging the YouTube API, Pandas for data manipulation, and SQL for data cleaning and organization, you can effectively manage and analyze YouTube channel data.

Overview:

1. Data source:
  Download CSV file (source_czech_rep_youtube.csv) containing information about various Czech YouTube channels.
  source of the data: https://www.kaggle.com/datasets/bhavyadhingra00020/top-100-social-media-influencers-2024-countrywise?resource=download

2. Data update with Pandas
  - Setting Up the Environment:
    Install necessary libraries using PIP or Anaconda to prepare for data processing.
  - Importing Libraries:
    Import essential libraries like pandas, dotenv, and google-api-python-client into your Python environment.
  - Loading Environment Variables:
    Load sensitive information, such as the YouTube API key, from a .env file for secure access.
  - Retrieving YouTube Channel Statistics:
    Define a function to fetch statistics (name, subscribers, views, videos) for each YouTube channel using their channel IDs.
  - Processing Channel Data:
    Load the CSV data and extract unique channel IDs for further analysis. 
  - Collecting Channel Statistics:
    Loop through the channel IDs, retrieve statistics, and compile them into a list.
  - Creating a DataFrame with Statistics:
    Convert the statistics list into a Pandas DataFrame and merge it with the original DataFrame for comprehensive data.
  - Finalizing the Data:
    Clean up the DataFrame by removing unnecessary columns and save the final data to a new CSV file (final_czech_rep_youtube.csv).

4. SQL Data Cleaning
  Import the merged data into Microsoft SQL Server for further cleaning and standardization, creating a view for easier access to necessary columns.

5. Create Power BI dashboard
   Use the cleaned data to create visualizations and dashboards in Power BI for further analysis.
