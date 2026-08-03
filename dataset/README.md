### Dataset Information
The dataset used in this project is sourced from Kaggle:

- Financial Transactions Dataset for Fraud Detection  
  https://www.kaggle.com/datasets/aryan208/financial-transactions-dataset-for-fraud-detection  

The dataset contains approximately **5 million transaction records**, simulating large-scale financial activity.

Due to file size constraints, the complete dataset is not included in this repository.

---

### Data Description
The dataset consists of high-volume financial transaction data designed to simulate real-world banking and payment system activity. Each record represents an individual transaction enriched with behavioural and risk-related attributes.

Key fields include:

- **Transaction Details**  
  `transaction_id`, `timestamp`, `amount`, `transaction_type`

- **Account Information**  
  `sender_account`, `receiver_account`

- **Contextual Attributes**  
  `merchant_category`, `location`, `payment_channel`

- **Device & Network Information**  
  `device_used`, `ip_address`, `device_hash`

- **Behavioural & Risk Indicators**  
  `time_since_last_transaction`,  
  `spending_deviation_score`,  
  `velocity_score`,  
  `geo_anomaly_score`

- **Fraud Labels**  
  `is_fraud` (boolean flag)  
  `fraud_type` (category of fraud, if applicable)

The dataset is pre-engineered with behavioural risk features commonly used in fraud detection systems, enabling analysis of transaction anomalies at scale.

The volume and structure of the data simulate real-time transaction streams processed in modern financial systems, allowing realistic exploration of fraud risk patterns and operational analytics.

---

### Usage
To reproduce this project:

1. Download the dataset from Kaggle  
2. Upload the dataset to AWS S3  
3. Load the data into Snowflake using the SQL scripts in `/sql`  
4. Perform data validation and transformation  
5. Execute analytical queries to evaluate fraud patterns and risk indicators  
