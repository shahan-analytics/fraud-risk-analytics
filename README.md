# AWS S3 + Snowflake Analytics Project

## Overview
This project demonstrates how to build a lightweight cloud analytics workflow by integrating AWS S3 with Snowflake to perform data analysis and solve business problems.

Instead of focusing on heavy data engineering pipelines, this project emphasizes practical data handling, querying, and insight generation using cloud-native tools.

## Objectives
- Connect AWS S3 with Snowflake for seamless data ingestion
- Load and analyze structured datasets (CSV format)
- Perform SQL-based analysis to answer business questions
- Generate insights that support decision-making
- Visualize workflows and results for clarity

## Tech Stack
- AWS S3 (data storage)
- Snowflake (data warehouse & analytics)
- SQL (data querying)
- Python (optional for preprocessing)
- Eraser AI (pipeline diagram creation)
- ChatGPT & Gemini (analysis assistance and ideation)

## Data Sources
The dataset used in this project is stored in the `/dataset` folder.  
It includes:
- Sample CSV files for analysis
- A README describing dataset structure and fields

Additional processed or result files can be stored separately if needed.

## Workflow

### 1. Data Storage (AWS S3)
- Upload CSV datasets to an S3 bucket
- Ensure proper folder organization for easy access

### 2. Snowflake Integration
- Create Snowflake stage connected to S3
- Load data into Snowflake tables using COPY INTO

### 3. Data Analysis
- Write SQL queries to explore and analyze the data
- Identify trends, patterns, and key metrics
- Solve business-focused questions

### 4. Insights & Reporting
- Summarize findings
- Prepare outputs for dashboards or reporting

## Pipeline Diagram
<img src="images/pipeline.png" width="600">

The pipeline was designed using Eraser AI to clearly illustrate data flow from AWS S3 to Snowflake and the analysis layer.

## Sample Dashboard / Output
<img src="images/dashboard.png" width="600">

Dashboards or outputs highlight key insights derived from Snowflake queries.

## Key Highlights
- Demonstrates real-world cloud data workflow
- Focuses on business problem-solving rather than complex engineering
- Uses industry-relevant tools (AWS + Snowflake)
- Incorporates AI tools (ChatGPT, Gemini) for faster analysis and idea generation
- Clean, modular, and easy-to-understand structure

## How to Run
1. Upload dataset files to your AWS S3 bucket
2. Create a Snowflake stage linked to S3
3. Load data into Snowflake tables
4. Run SQL queries for analysis
5. Review insights and visualize results

## Future Improvements
- Add automated data pipelines
- Integrate BI tools (Tableau / Power BI)
- Expand dataset for deeper analysis
- Implement real-time data ingestion

## Author
Shahan S
