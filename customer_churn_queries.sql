create database churn_db;
use churn_db;
CREATE TABLE customer_churn (
    customerID VARCHAR(50),
    gender VARCHAR(10),
    SeniorCitizen INT,
    Partner VARCHAR(10),
    Dependents VARCHAR(10),
    tenure INT,
    tenure_group VARCHAR(20),
    PhoneService VARCHAR(10),
    MultipleLines VARCHAR(20),
    InternetService VARCHAR(20),
    OnlineSecurity VARCHAR(20),
    OnlineBackup VARCHAR(20),
    DeviceProtection VARCHAR(20),
    TechSupport VARCHAR(20),
    StreamingTV VARCHAR(20),
    StreamingMovies VARCHAR(20),
    Contract VARCHAR(20),
    PaperlessBilling VARCHAR(10),
    PaymentMethod VARCHAR(50),
    MonthlyCharges FLOAT,
    TotalCharges FLOAT,
    Churn VARCHAR(10)
);
use churn_db;
show tables;
DROP TABLE `telco-customer-churn`;
show tables;
UPDATE customer_churn
SET tenure_group =
CASE 
    WHEN tenure <= 12 THEN 'New'
    WHEN tenure <= 24 THEN 'Medium'
    ELSE 'Old'
END;
UPDATE customer_churn
SET MultipleLines = REPLACE(MultipleLines, 'No phone service', 'No');
SELECT DISTINCT MultipleLines FROM customer_churn;
select * from customer_churn where tenure_group is null;
use churn_db;
select * from customer_churn;
select count(*)  as total_customers from customer_churn;
select count(*) churned_customer from customer_churn where churn = 'yes';
SELECT 
    (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) 
    AS Churn_Rate
FROM customer_churn;
SELECT AVG(MonthlyCharges) AS Avg_Monthly_Charges
FROM customer_churn;
SELECT AVG(tenure) AS Avg_Tenure
FROM customer_churn;
use churn_db;
SELECT Contract, Churn, COUNT(*) AS total
FROM customer_churn
GROUP BY Contract, Churn;
SELECT InternetService, Churn, COUNT(*)
FROM customer_churn
GROUP BY InternetService, Churn;
SELECT PaymentMethod, Churn, COUNT(*)
FROM customer_churn
GROUP BY PaymentMethod, Churn;
SELECT *
FROM customer_churn
WHERE MonthlyCharges > 80;