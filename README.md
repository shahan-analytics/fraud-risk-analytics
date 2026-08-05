## 🚨 Fraud Risk Analytics

End-to-end, SQL-driven analytics project simulating a real-world fraud investigation workflow using cloud-based data infrastructure.

This project focuses on analysing large-scale transaction data (~5M+ records) to uncover fraud patterns, behavioural anomalies, and key risk indicators.

---

## 🎯 Objective

To analyse financial transactions using pre-labelled fraud indicators (`is_fraud`) and identify behavioural patterns and risk signals associated with fraudulent activity.

---

## 🧠 Business Context

In real-world financial systems, machine learning models pre-flag suspicious transactions.

This project simulates the role of a **data analyst investigating flagged transactions**, using historical labelled data to:

- Understand why transactions are marked as fraudulent  
- Identify behavioural and transactional risk patterns  
- Generate insights to support fraud monitoring and prevention  

⚠️ This is an **analytical project**, not a predictive modeling task.

---

## 📂 Data Source

Dataset sourced from Kaggle:

- Financial Transactions Dataset for Fraud Detection  
  https://www.kaggle.com/datasets/aryan208/financial-transactions-dataset-for-fraud-detection  

- ~5 million transaction records  
- Simulates real-world financial activity across accounts, locations, and devices  

Due to size constraints, only a sample dataset is included in `/data`.

---

## ⚙️ Tech Stack

- **AWS S3** – Raw data storage  
- **Snowflake** – Cloud data warehouse  
- **SQL** – Data transformation and analysis  
- **Tableau** – Data visualization  
- **Eraser** – Pipeline/architecture diagram design  
- **ChatGPT & Gemini** – Assisted in analytical structuring and ideation  

---

## 🔄 Data Pipeline

Kaggle Dataset → AWS S3 → Snowflake → SQL Analysis → Tableau Dashboards  

---

## 🏗️ Data Architecture

![Pipeline](architecture/pipeline_architecture.png)

### ☁️ AWS S3 (Data Storage)
![S3](architecture/s3_data_storage.png)

### ❄️ Snowflake (Data Warehouse)
![Snowflake](architecture/snowflake_query_execution.png)

This architecture simulates a real-world cloud-based analytics workflow.

---

## 🧱 Data Modeling

- Data cleaning and standardisation  
- Handling timestamp inconsistencies  
- Structuring data for analytical queries  
- Optimisation for large-scale processing  

---

## 📊 Tableau Dashboards

### 1. Fraud Overview

![Fraud Overview](dashboards/fraud_overview.png)

- Total vs fraudulent transactions  
- Fraud rate and trend monitoring  
- High-level KPI tracking  

---

### 2. Transaction Behaviour Analysis

![Behaviour](dashboards/fraud_behavior.png)

- Transaction trends over time  
- Peak activity detection  
- Spending deviation insights  

---

### 3. Risk & Anomaly Insights

![Risk](dashboards/transaction_insights.png)

- High-risk channels and categories  
- Location-based anomalies  
- Behavioural indicators linked to fraud  

---

## 🧹 Data Preparation

- Data ingestion from AWS S3 into Snowflake  
- Cleaning and transformation using SQL  
- Validation and consistency checks  
- Query optimisation for performance  

---

## 🔍 Analytical Framework

### Phase 1: Transaction Overview
- Analysed transaction volume and distribution  
- Identified unusual activity patterns  

### Phase 2: Fraud Pattern Analysis
- Evaluated fraud rates across categories  
- Identified high-risk transaction types  

### Phase 3: Behavioural Analytics
- Analysed velocity and transaction frequency  
- Identified spending anomalies  

### Phase 4: Risk Profiling
- Combined indicators to assess fraud risk  
- Identified concentration of fraudulent activity  

### Phase 5: Advanced SQL Analysis
- Window functions (LAG, LEAD)  
- Rolling metrics and trend analysis  
- Sequential anomaly detection  

---

## 📈 Key Insights

- Fraud is concentrated in specific transaction types and channels  
- High transaction velocity strongly correlates with fraud  
- Behavioural deviations are key fraud indicators  
- Certain locations show higher fraud concentration  
- Combining multiple signals improves risk identification  

---

## 📁 Repository Structure

- `/sql` – SQL queries for analysis (Snowflake)  
- `/dashboards` – Tableau dashboard screenshots  
- `/architecture` – Pipeline and infrastructure visuals  
- `/data` – Dataset documentation and sample data  

---

## 💡 Skills Demonstrated

- Advanced SQL (joins, window functions, aggregations)  
- Cloud data workflow (AWS S3 → Snowflake)  
- Fraud risk analysis & anomaly detection  
- Behavioural data analysis  
- Large-scale data handling  
- Data storytelling with Tableau  

---

## 🛠️ Tools & Technologies

SQL • Snowflake • AWS S3 • Tableau • Data Warehousing • Analytics  

---

## 👤 Author

**Shahan S**
