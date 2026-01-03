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
1. The Head of Marketing has found that finding the top YouTube channels in the Canada to run marketing campaigns with difficult.
2. She has performed online research but constantly bumps into overly complicated and conflicting insights.
3. She has also held calls with different third-party providers, but they are all expensive options for underwhelming results.
4. The reporting team lack the bandwidth to assist her with this assignment.

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
1. Development
  - Data Exploration
  - Data Cleaning
  - Data Quality Check
  - Visualization
2. Analysis
3. Validation

 ---

### Development

#### Data Exploration
This is the stage where you have a scan of what’s in the data, errors, inconcsistencies, bugs, weird and corrupted characters etc. Steps taken at this stage:
1. Get source data from client
2. Exploring and analyzing data
3. Cell formatting from Text/General to Number
4. Rounding up values
5. Extracting Channel Name from first column separated by ‘@’ symbol.
![Excel Formula](/assets/images/Excel Formula - Split Cell Value.png)

#### Data Cleaning
The aim is to refine our dataset to ensure it is structured and ready for analysis. Steps taken at this stage:
1. Create new database – use database
2. Import excel file
3. Remove unnecessary columns (use SELECT statement)
4. Extract YouTube channel names from first column (use CHARINDEX & SUBSTRING)

 ![SQL Data Cleaning](/assets/images/SQL Data Cleaning.png)
6. Rename the columns as applicable
7. Create SQL view for Power BI

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

-- Another method to check duplicate
SELECT 
	COUNT(DISTINCT [Channel_Name]) 
FROM 
	[dbo].[view_canada_youtube]
```
![SQL Quality Check](/assets/images/SQL Data Testing.png)

#### Visualization
This is how dashboard looks like:
![Dashboard](assets/images/Power BI Dashboard Visual.png)

Steps taken at this stage:
1. Import SQL view file (cleaned) into power bi
2. Create DAX Measures

	- Total Subscriber (M) = Sum of Total Subscriber / 1000000

![](/assets/images/DAX Measure - Total Subscriber.png)

	- Total Views (B) = Sum of Total View / 1000000000

![](/assets/images/DAX Measure - Total Views.png)

	3. Total Videos = Sum of Total Videos

![](/assets/images/DAX Measure - Total Videos.png)

	4. Average Views per video (M) = (Sum of Total View / Sum of Total Videos) / 1000000

![](/assets/images/DAX Measure - Avg Views Per Video.png)

	5. Subscriber Engagement Rate = Sum of Total Subscriber / Sum of Total Videos

![](/assets/images/DAX Measure - Subs Eng Rate.png)

	6. Views per Subscriber = Sum of Total View / Sum of Total Subscriber

![](/assets/images/DAX Measure - views per subscriber.png)

- Build visuals
	1. Create table visual
	2. Create a tree map visual
	3. Create a scorecard
	4. Create a bar chart
	5. Clean up the dashboard – color coding and alignments

---

### Analysis
Create excel sheet to calculate top 3 YouTube channels values calculated using excel formulas:
1. Avg Views per Video = Filtered values from Power BI file.
2. Potential Product Sales per Video = Avg Views per Video * Conversion Rate
3. Potential Revenue per Video $CAD = Potential Product Sales per Video * Production Cost
4. Net Profit = Potential Revenue per Video $CAD – Campaign Cost

![](/assets/images/Excel Analysis.png)

---

### Validation
Calculation breakdown for Justin Bieber, Super Simple Songs - Kid Songs and The Weeknd using SQL query
1. Define Variables
2. Create CTE that rounds the average views per video
3. Select columns required for analysis
4. Filter result by YouTube channels with highest subscriber bases
5. Order by net profit (Highest to Lowest)

![](/assets/images/SQL Analysis.png)

---

### Findings & Discovery
1. Top 3 YouTubers with the most subscribers:
2. Top 3 channels have uploaded the most videos:
3. Top 3 channels have the most views:
4. Top 3 channels have the highest average views per video:
5. Top 3 channels have the highest views per subscriber ratio:
6. Top 3 channels have the highest subscriber engagement rate per video uploaded:
7. Potential ROI:
	- Setting up a collaboration deal with The Weeknd would make the client a net profit of $150,900 per video
	- An influencer marketing contract with Super Simple Songs - Kid Songs can see the client generate a net profit of $125,400
	- Justin Bieber could profit the client $73,200 per video too (which is worth considering)

---

### Recommendations
1. Justin Bieber is the best YouTube channel to collaborate with if we want to maximize visibility because this channel has the most YouTube subscribers in Canada.
2. Although Justin Bieber, Super Simple Songs - Kid Songs and The Weeknd are regular publishers on YouTube, it may be worth considering whether collaborating with them with the current budget caps are worth the effort, as the potential return on investments is significantly lower compared to the other channels.
3. The top 3 channels to form collaborations with are Justin Bieber, Super Simple Songs - Kid Songs and The Weeknd based on this analysis, because they attract the most engagement on their channels consistently.

---

### Action Plan
1. Reach out to the teams behind each of these channels, starting with The Weeknd.
2. Negotiate contracts within the budgets allocated to each marketing campaign.
3. Kick off the campaigns and track each of their performances against the KPIs.
4. Review how the campaigns have gone, gather insights and optimize based on feedback from converted customers and each channel’s audiences.



