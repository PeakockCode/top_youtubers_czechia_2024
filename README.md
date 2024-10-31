![header image](images/header.png)

# Repository of the Top Czech YouTubers (2024)
This workflow outlines the process of downloading, processing, analyzing and visualizing data from YouTube channels using Python, SQL and Power BI/Tableau. 
By leveraging the YouTube API, Pandas for data manipulation, SQL for data cleaning and organization, and Power BI/Tableau for analyse and visualization, you can effectively manage and analyze YouTube channel data.

Overview:

1. Data source:
  - Download the CSV file with rankings:  
    path: source_data_files/source_czech_rep_youtube_ranking.csv
  - Download the CSV file with engagement statistics:  
    path: source_data_files/source_czech_rep_youtube_engagement_rate.csv

2. Data update with Pandas (Python):
  - Retrieve YouTube channel statistics (such as subscribers, views, videos, and engagement rate) for each channel.
  - Save the updated data in updated_czech_rep_youtube.csv.
  - Python code for retrieving data via the YouTube API is provided in the Jupyter notebook.  
    path: jupyter_lab/youtube_api.ipynb
  - Instructions for creating a YouTube API key are provided in env file.  
    path: jupyter_lab/template .env
   
3. SQL Data Cleaning:
  - Import the updated CSV into Microsoft SQL Server for cleaning and standardization.
  - Create a view to simplify access to key columns.
  - SQL queries are available in SQLQuery_Youtube.sql.  
    path: sql_server/sql_data_cleaning/SQLQuery_Youtube.sql
  - Export the final cleaned data as final_czech_rep_youtube.csv.  
    Check the template file, path: sql_server/sql_data_cleaning/final_czech_rep_youtube.csv

4. Create Power BI/Tableau dashboard:
  - Use the cleaned data (from the SQL view or final_czech_rep_youtube.csv) to build visualizations and dashboards.
  - Create your dashboard in Power BI or Tableau for in-depth analysis.


Note: 

  - You can view an image of the dashboard:  
        path: images/TopYouTubers_CZ2024_DashboardImage.png
    
  - Download the original dashboard files:  
        path to Power BI: dashboards/TopYouTubers_CZ2024_TableauDashboard.twb  
        path to Tableau: dashboards/TopYouTubers_CZ2024_TableauDashboard.twb

---

  #  100 nejlepších českých YouTuberů (2024)
Tento repozitář poskytuje postup k celému procesu analýzy dat a tvorby dashboardu (o 100 nejlepších youtuberech) od stahování dat, přes jejich zpracování, analýzu a následnou vizualizaci. Postupně procházíme kroky za pomocí nástrojů jako je YouTube API, knihovna Pandas pro manipulaci s daty, SQL pro čištění a organizaci dat a Power BI/Tableau pro analýzu a vizualizaci.

1. Stažení dat:
- Stáhněte CSV soubor s top 100 nejlepšími youtubery v ČR:  
  cesta k souboru: source_data_files/source_czech_rep_youtube_ranking.csv
- Stáhněte CSV soubor se statistikami zapojení:  
  cesta k souboru: source_data_files/source_czech_rep_youtube_engagement_rate.csv
  
2. Aktualizace dat pomocí Pandas (Python):
- Statistické údaje o YouTube kanálech (například počet odběratelů, počty zhlédnutí videa či počty videí) pro každý kanál stažená přes Youtube API.
- Python kód pro získání dat pomocí YouTube API najdete v Jupyter notebooku.  
  cesta k souboru: jupyter_lab/youtube_api.ipynb
- Pokyny k vytvoření API klíče pro YouTube jsou uvedeny v souboru .env.  
  cesta k souboru: jupyter_lab/template .env

3. Čištění dat v SQL:
- Importujte aktualizovaný CSV soubor do Microsoft SQL Serveru pro čištění a standardizaci.
- Vytvořte view pro přístup k potřebným sloupcům.
- SQL dotazy jsou k dispozici v souboru SQLQuery_Youtube.sql.  
  cesta k souboru: sql_server/sql_data_cleaning/SQLQuery_Youtube.sql
- Exportujte konečná vyčištěná data jako soubor s názvem final_czech_rep_youtube.csv.
- Pokud chcete, můžete se podívat na vzorový soubor.  
  cesta k souboru: sql_server/sql_data_cleaning/final_czech_rep_youtube.csv

4. Vytvoření dashboardu v Power BI/Tableau:
- Použijte vyčištěná data (importujte přímo z view nebo naimportujte soubor final_czech_rep_youtube.csv) k vytvoření vizualizací.
- Vytvořte svůj dashboard v Power BI nebo Tableau.

Poznámka:
- Jako vzor může posloužit obrázek dashboardu:  
  cesta k souboru: images/TopYouTubers_CZ2024_DashboardImage.png
- Originály dashboardů lze stáhnout také:  
  cesta pro dasbhoard vytvořený v Power BI: dashboards/TopYouTubers_CZ2024_PowerBIdashboard.pbix  
  cesta pro dashboard vytvořený Tableau: dashboards/TopYouTubers_CZ2024_TableauDashboard.twb
