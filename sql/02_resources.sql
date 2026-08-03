USE DATABASE financial_fraud_db;
USE SCHEMA raw;
USE WAREHOUSE fraud_wh;

-- FILE FORAMT
CREATE OR REPLACE FILE FORMAT csv_format
TYPE = 'CSV'
FIELD_DELIMITER = ','
SKIP_HEADER = 1;

SHOW FILE FORMATS;

-- CREATE STAGE (S3)
CREATE OR REPLACE STAGE fraud_stage
URL = 's3://snow-bucket-shahan/source/'
CREDENTIALS = (
    AWS_KEY_ID = '      '
    AWS_SECRET_KEY = '      '
)
FILE_FORMAT = csv_format;

SHOW STAGES;
LIST @fraud_stage;

COPY INTO financial_transactions
FROM @fraud_stage/financial_fraud_detection_dataset.csv;

SELECT * FROM financial_transactions
LIMIT 20;FINANCIAL_FRAUD_DB
