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

Architecture artifacts included in the repository:

- `pipeline.png` – End-to-end workflow  
- `s3_bucket.png` – Data ingestion layer  
- `snowflake_db_architecture.png` – Data warehouse structure  

---

## Key Analysis and Insights

- Detection of abnormal transaction spikes  
- Identification of users with high fraud probability  
- Analysis of transaction trends and anomalies  
- KPI-driven insights for decision-making  

---

## Dashboards

Two analytical dashboards were created:

- Fraud Risk and Transaction Intelligence  
- Fraud Behaviour Analysis  

These dashboards enable:

- Monitoring of high-risk transactions  
- Exploration of user-level fraud patterns  
- Visualization of trends and anomalies  

---

## SQL Workflow

### Data Setup
- Created database objects and schemas  
- Defined structured tables for transaction storage  

### Data Integration
- Connected Snowflake to AWS S3  
- Configured staging for external data ingestion  

### Data Preparation
- Cleaned and standardized raw transaction data  
- Built a reliable dataset for downstream analysis  

### KPI Development
- Calculated key business metrics:
  - Total transactions  
  - Fraud rate  
  - Average transaction value  
  - Transaction distribution  

### Fraud Analysis
- Implemented logic to detect:
  - Suspicious transaction patterns  
  - High-risk users  
  - Behavioral anomalies  

---

## Dataset

`transactions_100_records.csv`

Contains structured transaction-level data including:

- Transaction ID  
- User details  
- Transaction amount  
- Timestamp  
- Fraud indicator  

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
Shahan S
This project is part of a data analytics portfolio focused on solving business problems using cloud-based data platforms and SQL.
