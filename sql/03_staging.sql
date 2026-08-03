USE DATABASE financial_fraud_db;
USE WAREHOUSE fraud_wh;
CREATE SCHEMA staging;

-- In production environments, tools like dbt are typically used for complex transformations.
-- Since this dataset is already well-structured, only minimal transformations are applied here.
-- Create cleaned table
CREATE OR REPLACE TABLE staging.cleaned_transactions AS
SELECT
    transaction_id,
    transaction_timestamp,
    sender_account,
    receiver_account,
    amount,
    transaction_type,
    merchant_category,
    UPPER(location) AS location,
    LOWER(device_used) AS device_used,
    CASE WHEN is_fraud IN ('TRUE', 'True', 1) THEN TRUE ELSE FALSE END AS is_fraud,
    fraud_type,
    time_since_last_transaction,
    spending_deviation_score,
    velocity_score,
    geo_anomaly_score,
    payment_channel,
    ip_address,
    device_hash,
    HOUR(transaction_timestamp) AS txn_hour,
    DAYNAME(transaction_timestamp) AS day_name,
    DATE(transaction_timestamp) AS txn_date
FROM raw.financial_transactions;

SELECT * FROM cleaned_transactions;
