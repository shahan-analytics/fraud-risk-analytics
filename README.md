## Fraud Risk Analytics

SQL-driven and cloud-enabled analytics project simulating a real-world fraud investigation environment, designed to analyse transactional patterns and identify key risk indicators associated with fraudulent activity.

---

### Objective
To analyse financial transaction data using labelled fraud indicators, enabling identification of behavioural anomalies and key risk signals associated with fraudulent transactions.

---

### Business Context
In real-world financial systems, machine learning models often pre-flag potentially fraudulent transactions.

This project simulates the role of a data analyst investigating these flagged transactions, using historical labelled data to uncover patterns, validate risk indicators, and generate insights that support fraud prevention strategies.

The analysis focuses on understanding why transactions are classified as fraudulent, rather than building predictive models.

---

### Data Source
The dataset used in this project is sourced from Kaggle:

- Financial Transactions Dataset for Fraud Detection  
  https://www.kaggle.com/datasets/aryan208/financial-transactions-dataset-for-fraud-detection  

The dataset was ingested into AWS S3 and processed within Snowflake to support scalable analytical workflows.

---

### Data Architecture & Pipeline

Kaggle Dataset → AWS S3 → Snowflake → SQL Analytics → Tableau Dashboards  

- AWS S3 used for raw data storage  
- Snowflake used as the cloud data warehouse  
- SQL used for transformation and analysis  
- Tableau used for visualization and insight delivery  

(Add architecture diagram in /images folder)

---

### Data Modeling

The dataset was structured and optimized within Snowflake to support efficient analytical querying.

- Data cleaning and standardisation  
- Handling inconsistencies in timestamps and transaction records  
- Optimisation for large-scale query performance  
- Structuring data for behavioural and risk analysis  

---

### Data Visualization (Tableau)

Interactive dashboards were developed to transform analytical outputs into actionable fraud risk insights.

- Highlights fraud trends and high-risk transaction patterns  
- Enables rapid identification of anomalies  
- Supports decision-making for fraud monitoring  
- Bridges the gap between raw data and business interpretation  

---

### Dashboards

#### 1. Fraud Overview Dashboard
(Add screenshot)

A high-level overview of fraud distribution across the dataset.

- Total transactions vs fraudulent transactions  
- Fraud rate and trend analysis  
- KPI-based monitoring of fraud activity  

---

#### 2. Transaction Behaviour Analysis
(Add screenshot)

Focuses on transaction dynamics and behavioural patterns.

- Transaction trends over time  
- Peak activity periods and unusual spikes  
- Spending deviation analysis  

---

#### 3. Risk & Anomaly Insights
(Add screenshot)

Designed to highlight high-risk indicators and suspicious patterns.

- High-risk transaction categories and channels  
- Location-based anomalies  
- Behavioural deviations linked to fraud  

---

### Data Preparation

- Data ingestion from AWS S3 into Snowflake  
- Data cleaning and transformation  
- Data validation and consistency checks  
- Query optimisation for performance  

---

### Analytical Framework

The project is structured into multiple analytical phases focusing on fraud risk evaluation.

#### Phase 1: Transaction Overview
- Analysed overall transaction distribution and volume  
- Identified peak periods and irregular activity  

#### Phase 2: Fraud Pattern Analysis
- Evaluated fraud rate across transaction types  
- Identified high-risk categories and channels  

#### Phase 3: Behavioural Analytics
- Analysed transaction velocity and frequency  
- Evaluated spending deviations from normal behaviour  
- Identified unusual transaction patterns  

#### Phase 4: Risk Profiling
- Combined multiple indicators to assess transaction risk  
- Analysed concentration of fraudulent activity  

#### Phase 5: Advanced SQL Analysis
- Applied window functions (LAG, LEAD) for sequential insights  
- Performed rolling and comparative analysis  
- Developed queries to highlight anomaly patterns  

---

### Key Insights

- Fraud is concentrated within specific transaction types and channels  
- High transaction velocity is a strong indicator of suspicious activity  
- Behavioural deviations highlight potential fraud cases  
- Certain locations show higher fraud occurrence  
- Combining multiple indicators improves fraud risk identification  

---

### Repository Structure

- `sql/` → data transformation and analytical queries  
- `images/` → architecture diagrams  
- `dashboards/` → Tableau visuals  
- `dataset/` → dataset reference  

---

### Skills Demonstrated

- Advanced SQL querying and optimisation  
- Cloud data pipeline design (AWS S3 + Snowflake)  
- Fraud risk analysis and anomaly detection  
- Behavioural data analysis  
- Large-scale data processing  
- Data visualization and storytelling using Tableau  

---

### Tools & Technologies

SQL (Snowflake) • AWS S3 • Tableau • Data Warehousing • Data Analytics  

---

### Author
Shahan S
