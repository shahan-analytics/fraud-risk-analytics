USE DATABASE financial_fraud_db;
USE SCHEMA staging;
USE WAREHOUSE fraud_wh;

SELECT * FROM cleaned_transactions
LIMIT 10;

-- 1. Total transaction volume, count, and average size
SELECT 
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_volume,
    AVG(amount) AS avg_transaction_value
FROM cleaned_transactions;
-- Helps understand overall scale and baseline transaction behavior

-- 2. Time span of transactions
SELECT 
    MIN(transaction_timestamp) AS start_date,
    MAX(transaction_timestamp) AS end_date,
    DATEDIFF(day, MIN(transaction_timestamp), MAX(transaction_timestamp)) AS total_days
FROM cleaned_transactions;
-- Defines the analytical window and temporal coverage of the dataset

-- 3. Daily transaction consistency
SELECT 
    DATE(transaction_timestamp) AS txn_day,
    COUNT(*) AS daily_transactions
FROM cleaned_transactions
GROUP BY txn_day
ORDER BY daily_transactions DESC;
-- Reveals operational load consistency and potential anomalies

-- 4. Fraud vs legitimate distribution
SELECT 
    is_fraud,
    COUNT(*) AS txn_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM cleaned_transactions
GROUP BY is_fraud;
-- Establishes class imbalance critical for fraud modeling

-- 5. % of total value from fraud
SELECT 
    SUM(CASE WHEN is_fraud = 1 THEN amount ELSE 0 END) / SUM(amount) * 100 AS fraud_value_percentage
FROM cleaned_transactions;
-- Shows financial impact of fraud beyond just counts

-- 6. Top 5% value concentration
WITH ranked AS (
    SELECT amount,
           NTILE(20) OVER (ORDER BY amount DESC) AS bucket
    FROM cleaned_transactions
)
SELECT 
    SUM(CASE WHEN bucket = 1 THEN amount ELSE 0 END),
    ROUND(SUM(CASE WHEN bucket = 1 THEN amount ELSE 0 END) / SUM(amount) * 100,2) AS top_5pct_value_share
FROM ranked;
-- Detects whether value is concentrated in a small subset of transactions

-- 7. Cities with highest volume
SELECT 
    location,
    COUNT(*) AS txn_count,
    SUM(amount) AS total_amount
FROM cleaned_transactions
GROUP BY location
ORDER BY total_amount DESC;
-- Identifies geographic concentration of activity

-- 8. Cities with highest fraud rate (FIXED LOGIC)
SELECT 
    location,
    COUNT(*) AS total_txns,
    SUM(CASE WHEN is_fraud THEN 1 ELSE 0 END) AS fraud_txns,
    ROUND(
        SUM(CASE WHEN is_fraud THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS fraud_rate
FROM cleaned_transactions
GROUP BY location
ORDER BY fraud_rate DESC;
-- Highlights high-risk geographic regions

-- 9. Transaction type distribution
SELECT 
    transaction_type,
    COUNT(*) AS txn_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM cleaned_transactions
GROUP BY transaction_type;
-- Helps understand operational transaction composition

-- 10. Avg value by transaction type
SELECT 
    transaction_type,
    AVG(amount) AS avg_value,
    SUM(amount) AS total_value
FROM cleaned_transactions
GROUP BY transaction_type
ORDER BY avg_value DESC;
-- Shows which transaction types carry higher financial weight

-- 11. Peak transaction hour
SELECT 
    HOUR(transaction_timestamp) AS txn_hour,
    COUNT(*) AS txn_count
FROM cleaned_transactions
GROUP BY txn_hour
ORDER BY txn_count DESC;
-- Identifies peak system load and user activity patterns

-- 12. Fraud rate by hour
SELECT 
    HOUR(transaction_timestamp) AS trxn_hour,
    COUNT(*) AS total_txns,
    SUM(CASE WHEN is_fraud = TRUE THEN 1 ELSE 0 END) AS fraud_txns,
    ROUND(
        SUM(CASE WHEN is_fraud = TRUE THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*), 
        2
    ) AS fraud_rate
FROM cleaned_transactions
GROUP BY trxn_hour
ORDER BY fraud_rate DESC;
-- Reveals time windows with elevated fraud risk

-- 13. Value bands
SELECT 
    CASE 
        WHEN amount < 100 THEN 'LOW (Amount < 100)'
        WHEN amount BETWEEN 100 AND 1000 THEN 'MEDIUM (Amount Between 100 AND 1000)'
        ELSE 'HIGH (Amount > 1000)'
    END AS value_band,
    COUNT(*) AS txn_count,
    SUM(amount) AS total_value
FROM cleaned_transactions
GROUP BY value_band;
-- Segments transaction behavior into meaningful tiers

-- 14. Fraud vs legit value comparison
SELECT 
    is_fraud,
    AVG(amount) AS avg_value,
    MEDIAN(amount) AS median_value
FROM cleaned_transactions
GROUP BY is_fraud;
-- Highlights monetary differences between fraud and normal behavior

-- 15. Executive summary
SELECT 
    COUNT(*) AS total_transactions,

    (
        SELECT COUNT(DISTINCT customer_id)
        FROM (
            SELECT sender_account AS customer_id FROM cleaned_transactions
            UNION
            SELECT receiver_account AS customer_id FROM cleaned_transactions
        ) u
    ) AS unique_customers,

    COUNT(DISTINCT location) AS total_cities,
    ARRAY_AGG(DISTINCT location) AS city_list,
    MIN(transaction_timestamp) AS start_date,
    MAX(transaction_timestamp) AS end_date,
    SUM(amount) AS total_transaction_value,
    AVG(amount) AS avg_transaction_value,
    MEDIAN(amount) AS median_transaction_value,

    SUM(CASE WHEN is_fraud = TRUE THEN 1 ELSE 0 END) AS total_fraud_transactions,

    ROUND(
        SUM(CASE WHEN is_fraud = TRUE THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*), 
        2
    ) AS fraud_rate_pct,

    SUM(CASE WHEN is_fraud = TRUE THEN amount ELSE 0 END) AS fraud_value,

    ROUND(
        SUM(CASE WHEN is_fraud = TRUE THEN amount ELSE 0 END) * 100.0 
        / SUM(amount), 
        2
    ) AS fraud_value_pct

FROM cleaned_transactions;
-- Provides a single-view executive summary of dataset scale, time coverage, user base, and fraud impact replace all the tables with cleaned_transactions, dont add staging.
