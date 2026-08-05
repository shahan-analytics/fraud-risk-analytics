# Fraud Detection and Transaction Intelligence

This project demonstrates the ability to transform raw transactional data into actionable business insights by integrating AWS S3 with Snowflake and applying SQL-based analysis to detect fraud patterns.

It highlights practical skills in data analysis, cloud integration, and solving real-world business problems using structured data.

---

## Project Summary

- Connected AWS S3 with Snowflake to enable seamless data ingestion  
- Built structured data layers for efficient querying and analysis  
- Cleaned and transformed raw transaction data using SQL  
- Developed key performance indicators (KPIs) to monitor transaction behavior  
- Identified fraud patterns and high-risk activities through analytical queries  
- Produced dashboard-ready datasets for business intelligence tools  

---

## Business Problem

Organizations handling digital transactions need to quickly identify fraudulent activities and understand user behavior patterns.

This project addresses:

- Detection of suspicious transactions  
- Identification of high-risk users  
- Monitoring fraud trends over time  
- Converting raw data into meaningful business insights  

---

## Architecture

Workflow:

Dataset → AWS S3 → Snowflake Stage → Staging Tables → Analytical Tables → Fraud Insights → Dashboards

### Architecture Artifacts

- [Pipeline Flow](architecture/pipeline.png)  
- [S3 Bucket Setup](architecture/s3_bucket.png)  
- [Snowflake Architecture](architecture/snowflake_db_architecture.png)  

---

## Key Analysis and Insights

- Detection of abnormal transaction spikes  
- Identification of users with high fraud probability  
- Analysis of transaction trends and anomalies  
- KPI-driven insights for decision-making  

---

## Dashboards

- [Fraud Risk and Transaction Intelligence](dashboards/Fraud%20Risk%20%26%20Transaction%20Intelligence.png)  
- [Fraud Behaviour Analysis](dashboards/Fraud_Behvaiour.png)  

---

## SQL Workflow

### Data Setup
- [`01_ddl.sql`](sql/01_ddl.sql)

### Data Integration
- [`02_resources.sql`](sql/02_resources.sql)

### Data Preparation
- [`03_staging.sql`](sql/03_staging.sql)

### KPI Development
- [`04_core_kpis.sql`](sql/04_core_kpis.sql)

### Fraud Analysis
- [`05_fraud_pattern.sql`](sql/05_fraud_pattern.sql)

---

## Dataset

- [`transactions_100_records.csv`](dataset/transactions_100_records.csv)

---

## How to Run

1. Upload dataset to AWS S3  
2. Execute SQL scripts in sequence:
   - `01_ddl.sql`  
   - `02_resources.sql`  
   - `03_staging.sql`  
   - `04_core_kpis.sql`  
   - `05_fraud_pattern.sql`  
3. Connect Snowflake to a BI tool (Power BI or Tableau) for visualization  

---

## Tech Stack

- Snowflake  
- AWS S3  
- SQL  
- Power BI / Tableau  

---

## Key Skills Demonstrated

- Cloud data integration (AWS S3 + Snowflake)  
- Data cleaning and transformation using SQL  
- Analytical thinking and business problem solving  
- KPI design and interpretation  
- Fraud detection using data analysis  

---

## Potential Enhancements

- Scale to larger datasets  
- Implement real-time data ingestion  
- Apply machine learning models for fraud prediction  
- Build automated alerting systems  

---

## Author

This project is part of a data analytics portfolio focused on solving business problems using cloud-based data platforms and SQL.
