
USE DATABASE financial_fraud_db;
USE SCHEMA staging;
USE WAREHOUSE fraud_wh;

SELECT * FROM cleaned_transactions
LIMIT 10;

--1. Do fraudulent transactions tend to have higher or lower values?
SELECT 
    is_fraud,
    AVG(amount) AS avg_value,
    MEDIAN(amount) AS median_value,
    MAX(amount) AS max_value,
    MIN(amount) AS min_value
FROM cleaned_transactions
GROUP BY is_fraud;
-- Helps identify whether fraud is concentrated in extreme or typical transaction ranges

--2. Which transaction types have highest fraud likelihood?
SELECT 
    transaction_type,
    COUNT(*) AS total_txns,
    SUM(CASE WHEN is_fraud = TRUE THEN 1 ELSE 0 END) AS fraud_txns,
    ROUND(
        SUM(CASE WHEN is_fraud = TRUE THEN 1 ELSE 0 END) * 100.0 / COUNT(*),  
        2
    ) AS fraud_rate
FROM cleaned_transactions
GROUP BY transaction_type
ORDER BY fraud_rate DESC;
-- Identifies transaction channels most vulnerable to fraud

--3. Which transaction types contribute most to fraud value?
SELECT 
    transaction_type,
    SUM(CASE WHEN is_fraud = 1 THEN amount ELSE 0 END) AS fraud_value
FROM cleaned_transactions
GROUP BY transaction_type
ORDER BY fraud_value DESC;
-- Shows where financial fraud impact is highest across transaction categories

--4. Are high-value transactions more likely fraudulent?
SELECT 
    CASE 
        WHEN amount < 100 THEN 'low'
        WHEN amount BETWEEN 100 AND 1000 THEN 'medium'
        ELSE 'high'
    END AS value_band,
    COUNT(*) AS total_txns,
    SUM(CASE WHEN is_fraud = TRUE THEN 1 ELSE 0 END) AS fraud_txns,
    ROUND(
        SUM(CASE WHEN is_fraud = TRUE THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
        2
    ) AS fraud_rate
FROM cleaned_transactions
GROUP BY value_band
ORDER BY fraud_rate DESC;
-- Helps detect whether fraud risk increases with transaction size

--5. At what hours is fraud most likely?
SELECT 
    HOUR(transaction_timestamp) AS txn_hour,
    COUNT(*) AS total_txns,
    SUM(CASE WHEN is_fraud = TRUE THEN 1 ELSE 0 END) AS fraud_txns,
    ROUND(
        SUM(CASE WHEN is_fraud = TRUE THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
        2
    ) AS fraud_rate
FROM cleaned_transactions
GROUP BY txn_hour
ORDER BY fraud_rate DESC;
-- Reveals suspicious time windows with elevated fraud activity

--6. Does fraud vary by day of week?
SELECT 
    day_name,
    COUNT(*) AS total_txns,
    SUM(CASE WHEN is_fraud = TRUE THEN 1 ELSE 0 END) AS fraud_txns,
    ROUND(
        SUM(CASE WHEN is_fraud = TRUE THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
        2
    ) AS fraud_rate
FROM cleaned_transactions
GROUP BY day_name
ORDER BY fraud_rate DESC;
-- Highlights whether fraud spikes during weekends or specific weekdays

--7. Do fraudulent users transact more frequently than normal users?
WITH user_activity AS (
    SELECT 
        sender_account,
        COUNT(*) AS txn_count,
        SUM(CASE WHEN is_fraud = TRUE THEN 1 ELSE 0 END) AS fraud_txns
    FROM cleaned_transactions
    GROUP BY sender_account
)
SELECT 
    CASE WHEN fraud_txns > 0 THEN 'fraud_user' ELSE 'normal_user' END AS user_type,
    AVG(txn_count) AS avg_transactions
FROM user_activity
GROUP BY user_type;
-- Helps identify whether fraud users show higher activity levels

SELECT * FROM cleaned_transactions
LIMIT 10;

SELECT 
    sender_account, COUNT(*) AS no_of_trns
FROM cleaned_transactions
GROUP BY sender_account
ORDER BY no_of_trns desc ;

--8. Do users suddenly make transactions far larger than their historical behavior?
WITH user_avg AS (
    SELECT 
        sender_account,
        AVG(amount) AS avg_amount
    FROM cleaned_transactions
    GROUP BY sender_account
)
SELECT 
    t.sender_account,
    t.amount,
    u.avg_amount,
    t.amount / u.avg_amount AS deviation_ratio
FROM cleaned_transactions t
JOIN user_avg u ON t.sender_account = u.sender_account
WHERE t.amount > 3 * u.avg_amount
ORDER BY deviation_ratio DESC;
-- Flags transactions that significantly deviate from normal user behavior

--9. Are there repeated transactions with identical amounts in sequence (possible scripted fraud)?
WITH seq AS (
    SELECT 
        sender_account,
        amount,
        LAG(amount) OVER (PARTITION BY sender_account ORDER BY transaction_timestamp) AS prev_amount
    FROM cleaned_transactions
)
SELECT 
    sender_account,
    COUNT(*) AS repeated_txns
FROM seq
WHERE amount = prev_amount
GROUP BY sender_account
ORDER BY repeated_txns DESC;
-- Identifies bot-like or repetitive transaction patterns


--10. Are users transacting from multiple cities within a short time window?
WITH city_seq AS (
    SELECT 
        sender_account,
        location,
        transaction_timestamp,
        LAG(location) OVER (PARTITION BY sender_account ORDER BY transaction_timestamp) AS prev_city,
        LAG(transaction_timestamp) OVER (PARTITION BY sender_account ORDER BY transaction_timestamp) AS prev_time
    FROM cleaned_transactions
)
SELECT 
    sender_account,
    COUNT(*) AS suspicious_city_switches
FROM city_seq
WHERE location <> prev_city
AND DATEDIFF(hour, prev_time, transaction_timestamp) <= 2
GROUP BY sender_account
ORDER BY suspicious_city_switches DESC;
-- Flags impossible travel scenarios indicating account compromise

--11. Are high-value transactions more likely to occur during unusual hours?
SELECT 
    CASE 
        WHEN txn_hour BETWEEN 0 AND 5 THEN 'night'
        ELSE 'day'
    END AS time_period,
    COUNT(*) AS total_txns,
    SUM(CASE WHEN is_fraud = TRUE THEN 1 ELSE 0 END) AS fraud_txns,
    AVG(amount) AS avg_amount
FROM CLEANED_TRANSACTIONS
GROUP BY time_period;
-- Detects risky behavior concentrated in low-activity hours

-- 12. Do dormant accounts suddenly become active and perform fraud?
WITH txn_gap AS (
    SELECT 
        sender_account,
        txn_date,
        LAG(txn_date) OVER (PARTITION BY sender_account ORDER BY txn_date) AS prev_txn
    FROM cleaned_transactions
)
SELECT 
    sender_account,
    COUNT(*) AS suspicious_events
FROM txn_gap
WHERE DATEDIFF(day, prev_txn, txn_date) > 30
AND EXISTS (
    SELECT 1 
    FROM cleaned_transactions f 
    WHERE f.sender_account = txn_gap.sender_account 
    AND f.is_fraud = 1
)
GROUP BY sender_account;
-- Detects account takeover after inactivity


