### Data Description
The dataset contains enriched financial transaction records designed for fraud risk analysis. Each row represents an individual transaction with associated behavioural and risk-related attributes.

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

The dataset is pre-engineered with behavioural risk features, enabling deeper analysis of transaction anomalies and fraud patterns without requiring model development.
