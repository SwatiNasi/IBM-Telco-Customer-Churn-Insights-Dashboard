use customer_churn;
describe telco_churn;
select 
    SUM(customerID IS NULL) AS missing_customerID,
    SUM(gender IS NULL) AS missing_gender,
    SUM(SeniorCitizen IS NULL) AS missing_senior_citizen,
    SUM(Partner IS NULL) AS missing_partner,
    SUM(Dependents IS NULL) AS missing_dependents,
    SUM(tenure IS NULL) AS missing_tenure,
    SUM(PhoneService IS NULL) AS missing_phoneservice,
    SUM(MultipleLines IS NULL) AS missing_multiplelines,
    SUM(InternetService IS NULL) AS missing_internetservice,
    SUM(OnlineSecurity IS NULL) AS missing_onlinesecurity,
    SUM(OnlineBackup IS NULL) AS missing_onlinebackup,
    SUM(DeviceProtection IS NULL) AS missing_deviceprotection,
    SUM(TechSupport IS NULL) AS missing_techsupport,
    SUM(StreamingTV IS NULL) AS missing_streamingtv,
    SUM(StreamingMovies IS NULL) AS missing_streamingmovies,
    SUM(Contract IS NULL) AS missing_contract,
	SUM(PaymentMethod IS NULL) AS missing_paymentmethod,
    SUM(PaperlessBilling IS NULL) AS missing_paperlessbilling,
    SUM(MonthlyCharges IS NULL) AS missing_monthlycharges,
    SUM(TotalCharges IS NULL) AS missing_totalcharges,
    SUM(Churn IS NULL) AS missing_churn
FROM telco_churn;

ALTER TABLE telco_churn
DROP COLUMN tenure_group;

ALTER TABLE telco_churn
ADD COLUMN tenure_group VARCHAR(20);

UPDATE telco_churn
SET tenure_group =
    CASE
        WHEN tenure BETWEEN 1 AND 12 THEN '1 Year'
        WHEN tenure BETWEEN 13 AND 24 THEN '2 Years'
        WHEN tenure BETWEEN 25 AND 36 THEN '3 Years'
        WHEN tenure BETWEEN 37 AND 48 THEN '4 Years'
        WHEN tenure BETWEEN 49 AND 60 THEN '5 Years'
        WHEN tenure BETWEEN 61 AND 72 THEN '6 Years'
    END;

select tenure_group,count(*) as total_customers 
from telco_churn
group by tenure_group
order by total_customers desc;

ALTER TABLE telco_churn
ADD COLUMN monthly_charge_range VARCHAR(30);

UPDATE telco_churn
SET monthly_charge_range =
    CASE
        WHEN MonthlyCharges < 35 THEN 'Below 35'
        WHEN MonthlyCharges < 50 THEN '35-49.99'
        WHEN MonthlyCharges < 75 THEN '50-74.99'
        ELSE '75 and above'
    END;
    
SELECT
    monthly_charge_range,
    COUNT(*) AS total_customers
FROM telco_churn
GROUP BY monthly_charge_range
ORDER BY MIN(MonthlyCharges);

select 
count(*) as total_customers, 
sum(Churn='yes') as churned_customer, 
sum(Churn='no') as retaines_customer,
round(sum(Churn='yes') * 100 / count(*),2) as churn_rate,
round(avg(MonthlyCharges),2) as monthly_charge,
round(avg(tenure),2) as avg_tenure
from telco_churn;

-- Individual Customer Services Analysis

SELECT
    InternetService,
    COUNT(*) AS total_customers,
    SUM(Churn = 'Yes') AS churned_customers,
    SUM(Churn = 'No') AS retained_customers,
    ROUND(
        SUM(Churn = 'Yes') * 100.0 / COUNT(*), 2
    ) AS churn_rate,
    ROUND(AVG(CASE WHEN Churn = 'Yes' THEN MonthlyCharges END), 2) AS avg_charges_churned,
	ROUND(AVG(CASE WHEN Churn = 'No' THEN MonthlyCharges END), 2) AS avg_charges_retained
FROM telco_churn
GROUP BY InternetService;

SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(Churn = 'Yes') AS churned_customers,
    SUM(Churn = 'No') AS retained_customers,
    ROUND(
        SUM(Churn = 'Yes') * 100.0 / COUNT(*), 2
    ) AS churn_rate,
    ROUND(AVG(CASE WHEN Churn = 'Yes' THEN MonthlyCharges END), 2) AS avg_charges_churned,
	ROUND(AVG(CASE WHEN Churn = 'No' THEN MonthlyCharges END), 2) AS avg_charges_retained
FROM telco_churn
GROUP BY Contract;

SELECT
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(Churn = 'Yes') AS churned_customers,
    SUM(Churn = 'No') AS retained_customers,
    ROUND(
        SUM(Churn = 'Yes') * 100.0 / COUNT(*), 2
    ) AS churn_rate,
    ROUND(AVG(CASE WHEN Churn = 'Yes' THEN MonthlyCharges END), 2) AS avg_charges_churned,
	ROUND(AVG(CASE WHEN Churn = 'No' THEN MonthlyCharges END), 2) AS avg_charges_retained
FROM telco_churn
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;

SELECT
    tenure_group,
    COUNT(*) AS total_customers,
    SUM(Churn = 'Yes') AS churned_customers,
    SUM(Churn = 'No') AS retained_customers,
    ROUND(
        SUM(Churn = 'Yes') * 100.0 / COUNT(*), 2
    ) AS churn_rate,
    ROUND(AVG(CASE WHEN Churn = 'Yes' THEN MonthlyCharges END), 2) AS avg_charges_churned,
	ROUND(AVG(CASE WHEN Churn = 'No' THEN MonthlyCharges END), 2) AS avg_charges_retained
FROM telco_churn
GROUP BY tenure_group
ORDER BY churn_rate DESC;

SELECT
    monthly_charge_range,
    COUNT(*) AS total_customers,
    SUM(Churn = 'Yes') AS churned_customers,
    SUM(Churn = 'No') AS retained_customers,
    ROUND(
        SUM(Churn = 'Yes') * 100.0 / COUNT(*), 2
    ) AS churn_rate,
    ROUND(AVG(CASE WHEN Churn = 'Yes' THEN MonthlyCharges END), 2) AS avg_charges_churned,
	ROUND(AVG(CASE WHEN Churn = 'No' THEN MonthlyCharges END), 2) AS avg_charges_retained
FROM telco_churn
GROUP BY monthly_charge_range
ORDER BY churn_rate DESC;

-- combined with each other

SELECT
    Contract,
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(Churn = 'Yes') AS churned_customers,
    SUM(Churn = 'No') AS retained_customers,
    ROUND(
        SUM(Churn = 'Yes') * 100.0 / COUNT(*), 2
    ) AS churn_rate,
    ROUND(AVG(CASE WHEN Churn = 'Yes' THEN MonthlyCharges END), 2) AS avg_charges_churned,
	ROUND(AVG(CASE WHEN Churn = 'No' THEN MonthlyCharges END), 2) AS avg_charges_retained
FROM telco_churn
GROUP BY
    Contract,
    PaymentMethod
ORDER BY churn_rate DESC;

SELECT
    Contract,
    InternetService,
    COUNT(*) AS total_customers,
    SUM(Churn = 'Yes') AS churned_customers,
    SUM(Churn = 'No') AS retained_customers,
    ROUND(
        SUM(Churn = 'Yes') * 100.0 / COUNT(*), 2
    ) AS churn_rate,
    ROUND(AVG(CASE WHEN Churn = 'Yes' THEN MonthlyCharges END), 2) AS avg_charges_churned,
	ROUND(AVG(CASE WHEN Churn = 'No' THEN MonthlyCharges END), 2) AS avg_charges_retained
FROM telco_churn
GROUP BY
    Contract,
    InternetService
ORDER BY churn_rate DESC;

SELECT
    tenure_group,
    monthly_charge_range,
    COUNT(*) AS total_customers,
    SUM(Churn = 'Yes') AS churned_customers,
    SUM(Churn = 'No') AS retained_customers,
    ROUND(
        SUM(Churn = 'Yes') * 100.0 / COUNT(*), 2
    ) AS churn_rate,
    ROUND(AVG(CASE WHEN Churn = 'Yes' THEN MonthlyCharges END), 2) AS avg_charges_churned,
	ROUND(AVG(CASE WHEN Churn = 'No' THEN MonthlyCharges END), 2) AS avg_charges_retained
FROM telco_churn
GROUP BY
    tenure_group,
    monthly_charge_range
ORDER BY churn_rate DESC;

--  Highest Churned Customer Segments (Combined Analysis)

WITH customer_segments AS (
    SELECT
        Contract,
        InternetService,
        PaymentMethod,
        tenure_group,
        Monthly_Charge_Range,

        COUNT(*) AS Total_Customers,

        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
            AS Churned_Customers,

        SUM(CASE WHEN Churn = 'No' THEN 1 ELSE 0 END)
            AS Retained_Customers,

        ROUND(
            SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
            * 100.0 / COUNT(*), 2
        ) AS Churn_Rate,

        ROUND(
            AVG(CASE WHEN Churn = 'Yes' THEN MonthlyCharges END), 2
        ) AS avg_charges_churned,

        ROUND(
            AVG(CASE WHEN Churn = 'No' THEN MonthlyCharges END), 2
        ) AS avg_charges_retained

    FROM telco_churn

    GROUP BY
        Contract,
        InternetService,
        PaymentMethod,
        tenure_group,
        Monthly_Charge_Range
)

SELECT *
FROM customer_segments
WHERE Churned_Customers > 40
ORDER BY Churned_Customers DESC;

-- Demographic Churn Analysis

WITH demographic_analysis AS (
    SELECT
        Gender,
        SeniorCitizen,
        Partner,
        Dependents,

        COUNT(*) AS Total_Customers,

        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
            AS Churned_Customers,

        SUM(CASE WHEN Churn = 'No' THEN 1 ELSE 0 END)
            AS Retained_Customers,

        ROUND(
            SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
            * 100.0 / COUNT(*), 2
        ) AS Churn_Rate

    FROM telco_churn

    GROUP BY
        Gender,
        SeniorCitizen,
        Partner,
        Dependents
)

SELECT *
FROM demographic_analysis
ORDER BY Churned_Customers DESC, Churn_Rate DESC;



-- Customer Services and Billing Churn Analysis

WITH service_analysis AS (

    SELECT
        'Phone Service' AS Service,
        PhoneService AS Service_Status,
        COUNT(*) AS Total_Customers,
        SUM(Churn = 'Yes') AS Churned_Customers,
        SUM(Churn = 'No') AS Retained_Customers,
        ROUND(SUM(Churn = 'Yes') * 100.0 / COUNT(*), 2) AS Churn_Rate
    FROM telco_churn
    GROUP BY PhoneService

    UNION ALL

    SELECT
        'Multiple Lines',
        MultipleLines,
        COUNT(*),
        SUM(Churn = 'Yes'),
        SUM(Churn = 'No'),
        ROUND(SUM(Churn = 'Yes') * 100.0 / COUNT(*), 2)
    FROM telco_churn
    GROUP BY MultipleLines

    UNION ALL

    SELECT
        'Online Security',
        OnlineSecurity,
        COUNT(*),
        SUM(Churn = 'Yes'),
        SUM(Churn = 'No'),
        ROUND(SUM(Churn = 'Yes') * 100.0 / COUNT(*), 2)
    FROM telco_churn
    GROUP BY OnlineSecurity

    UNION ALL

    SELECT
        'Tech Support',
        TechSupport,
        COUNT(*),
        SUM(Churn = 'Yes'),
        SUM(Churn = 'No'),
        ROUND(SUM(Churn = 'Yes') * 100.0 / COUNT(*), 2)
    FROM telco_churn
    GROUP BY TechSupport

    UNION ALL

    SELECT
        'Online Backup',
        OnlineBackup,
        COUNT(*),
        SUM(Churn = 'Yes'),
        SUM(Churn = 'No'),
        ROUND(SUM(Churn = 'Yes') * 100.0 / COUNT(*), 2)
    FROM telco_churn
    GROUP BY OnlineBackup

    UNION ALL

    SELECT
        'Device Protection',
        DeviceProtection,
        COUNT(*),
        SUM(Churn = 'Yes'),
        SUM(Churn = 'No'),
        ROUND(SUM(Churn = 'Yes') * 100.0 / COUNT(*), 2)
    FROM telco_churn
    GROUP BY DeviceProtection

    UNION ALL

    SELECT
        'Streaming TV',
        StreamingTV,
        COUNT(*),
        SUM(Churn = 'Yes'),
        SUM(Churn = 'No'),
        ROUND(SUM(Churn = 'Yes') * 100.0 / COUNT(*), 2)
    FROM telco_churn
    GROUP BY StreamingTV

    UNION ALL

    SELECT
        'Streaming Movies',
        StreamingMovies,
        COUNT(*),
        SUM(Churn = 'Yes'),
        SUM(Churn = 'No'),
        ROUND(SUM(Churn = 'Yes') * 100.0 / COUNT(*), 2)
    FROM telco_churn
    GROUP BY StreamingMovies
)

SELECT *
FROM service_analysis;


    