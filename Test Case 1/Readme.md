**1. ETL Pipeline with Incremental Data Loading**  
    - **Objective: Build an ETL pipeline to load new data into MySQL without duplication.**   
    - **Steps:**  

1. Extract data from multiple sources (CSV files, APIs, etc.).
2. Check for new records based on a timestamp or unique ID.
3. Transform the data (e.g., handle missing values, change data types).
4. Load only new records into the MySQL database, avoiding duplicates.