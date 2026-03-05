CREATE DATABASE Sale;
USE Sale;

CREATE TABLE Sales_Data_Transactions (
customer_id VARCHAR(255),
trans_date DATE,
tran_amount INT
);
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Retail_Data_Transactions.csv"
INTO TABLE Sales_Data_Transactions
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@customer_id,@trans_date,@tran_amount)
SET 
customer_id = @customer_id,
trans_date = str_to_date(@trans_date, '%d-%b-%y'),
tran_amount = @tran_amount;

CREATE TABLE Sales_Data_Response (
customer_id VARCHAR(255),
response INT
);
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Retail_Data_Response.csv"
INTO TABLE Sales_Data_Response
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT * FROM Sales_Data_Transactions LIMIT 10;
EXPLAIN SELECT *  FROM Sales_Data_Transactions WHERE customer_id = 'CS5295';
CREATE INDEX idx_id ON Sales_Data_Transactions (customer_id);


