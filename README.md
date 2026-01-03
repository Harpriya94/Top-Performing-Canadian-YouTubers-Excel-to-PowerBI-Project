# 🌟Excel to Power BI Project - Top Performing Canadian YouTubers
This is an end-to-end **data analytics project** demonstrating my ability to **clean, analyze, and visualize data** using **Excel, SQL, and Power BI** to support **real-world business decisions**.

## 📋Table of contents
- [Overview](#overview)
- [Business Challenge](#business-challenge)
- [Tools & Technologies](#tools&Technologies)  
- [Project Stages](#project-stages)
  - [Development](#development)
    - [Data Exploration](#data-exploration)
    - [Data Cleaning](#data-cleaning)
    - [Data Quality Check](#data-quality-check)
    - [Visualization](#visualization)
  - [Analysis](#analysis)
  - [Validation](#validation)
- [Findings & Discovery](#findings&discovery)
- [Recommendations](#recommendations)
- [Action Plan](#action-plan)

### 📝Overview
The project focuses on identifying **high-performing Canadian YouTubers** to help marketing teams select influencers based on **engagement, reach, and ROI**.

The Head of Marketing wants to use a dashboard to analyze the top performing YouTube channels in the Canada. This project displays the steps taken to convert raw excel data into power bi dashboard.

![Raw Data](/assets/images/Excel Dataset.png) 
![Power BI Dashboard](/assets/images/Power BI Dashboard Visual.png)

---

### 💻Business Challenge
-	The Head of Marketing has found that finding the top YouTube channels in the Canada to run marketing campaigns with difficult.
-	She has performed online research but constantly bumps into overly complicated and conflicting insights.
-	She has also held calls with different third-party providers, but they are all expensive options for underwhelming results.
-	The reporting team lack the bandwidth to assist her with this assignment.

---

### ⚙️Tools & Technologies

| Tool |Purpose | Skills Demonstrated |
|-----|---------|-----------|
| Excel | Exploring the data | Formulas, Data Conversion, Data Formatting |
| SQL | Cleaning, testing, and analyzing the data | CTEs, INFORMATION_SCHEMA, SQL Views |
| Power BI | Visualizing the data via interactive dashboards | DAX measures, Charts, Maps |
| Github | Hosting the project documentation and version control | Project Mangement | 

---

### 🪜Project Stages
The general approach in creating this solution from start to finish.
- Development
  - Data Exploration
  - Data Cleaning
  - Data Quality Check
  - Visualization
- Analysis
- Validation

 ---

### Development

#### Data Exploration
This is the stage where you have a scan of what’s in the data, errors, inconcsistencies, bugs, weird and corrupted characters etc. Steps taken at this stage:
- Get source data from client
- Exploring and analyzing data
- Cell formatting from Text/General to Number
- Rounding up values
- Extracting Channel Name from first column separated by ‘@’ symbol.
  
![Excel Formula](/assets/images/Excel Formula - Split Cell Value.png) 

#### Data Cleaning
The aim is to refine our dataset to ensure it is structured and ready for analysis. Steps taken at this stage:
- Create new database – use database
- Import excel file
- Remove unnecessary columns (use SELECT statement)
- Extract YouTube channel names from first column (use CHARINDEX & SUBSTRING)

![SQL Data Cleaning](/assets/images/SQL Data Cleaning.png)
  
- Rename the columns as applicable
- Create SQL view for Power BI

![SQL View](/assets/images/SQL View.png)


#### Data Quality Check
Steps taken at this stage:
- Row count test: at least 100 records required (Use COUNT)
```sql
-- Row Count Check
SELECT 
	COUNT(*) AS No_of_rows
FROM 
	[dbo].[view_canada_youtube]
```
  
- Column count test: at least 4 columns required (Use COUNT in INFORMATION_SCHEMA.COLUMNS)
```sql
-- Column Count Check
SELECT 
	COUNT(*) AS No_of_cols 
FROM 
	INFORMATION_SCHEMA.COLUMNS
WHERE 
	TABLE_NAME = 'view_canada_youtube'
```

- Datatype check: Channel name must be string and other columns should be whole numbers (Use INFORMATION_SCHEMA)
```sql
-- Datatype Check
SELECT 
	COLUMN_NAME, DATA_TYPE
FROM 
	INFORMATION_SCHEMA.COLUMNS
WHERE 
	TABLE_NAME = 'view_canada_youtube'
```

- Duplicate check: each record must be unique (Use COUNT, GROUP BY, HAVING)
```sql
-- Duplicate Check
SELECT 
	[Channel_Name],
	COUNT(*) AS duplicate_count
FROM 
	[dbo].[view_canada_youtube]
GROUP BY
	Channel_Name
HAVING
	COUNT(*) > 1

--Another method to check duplicate
SELECT 
	COUNT(DISTINCT [Channel_Name]) 
FROM 
	[dbo].[view_canada_youtube]
```

![SQL Quality Check](/assets/images/SQL Data Testing.png)

#### Visualization



---

### Analysis

---

### Validation

---





---



---


---


---



---

<img src="/assets/images/Excel Dataset.png" width="30%" /> ➡️ <img src="/assets/images/Power BI Dashboard Visual.png" width="30%" />

