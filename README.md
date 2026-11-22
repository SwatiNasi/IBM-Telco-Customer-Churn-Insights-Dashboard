
📊 IBM Telco Customer Churn Insights Dashboard

📌 Overview

This project analyses customer churn using SQL and Power BI with the IBM Telco Customer Churn dataset.

The project focuses on understanding customer churn patterns, analysing different customer groups and identifying high-risk customer segments.

🎯 Objectives

- Analyse customer churn.
- Understand customer churn patterns.
- Analyse different customer segments and demographics.
- Study churn across services and billing patterns.
- Identify high-risk customer groups.

🛠️ Tools & Technologies

- SQL (MySQL)
- Power BI Desktop
- DAX

📂 Dataset

- Source: Kaggle – IBM Telco Customer Churn Dataset.
- Total Customers: 7,032

📊 Key Metrics

| Metric | Value |
|---|---:|
| Total Customers | 7,032 |
| Churned Customers | 1,869 |
| Retained Customers | 5,163 |
| Churn Rate | 26.58% |

 📈 Project Work

🔹 SQL Analysis

- Performed data cleaning and analysis using ALTER TABLE, UPDATE, GROUP BY and aggregate functions.
- Used CTEs with GROUP BY and aggregate functions for high-risk customer and demographic analysis.
- Used CTEs with UNION ALL for additional services and billing analysis.

🔹 Power BI Dashboard

Created a five-page interactive dashboard using DAX.

 1. Customer Churn Overview

- Analysed total customers, churned customers and retained customers.
- Examined the overall customer churn rate.

 2. Contract and Customer Segmentation Analysis

- Analysed churn across contract types.
- Compared internet services and payment methods.
- Explored tenure groups and monthly charge ranges.

 3. High-Risk Customer Segments by Combined Factors

- Analysed multiple customer factors together to identify high-risk customer groups.
- Examined contract type, internet service, payment method, tenure group and monthly charge range.

 4. Customer Demographics Analysis

- Analysed customer demographics using CTEs, GROUP BY and aggregate functions.
- Used interactive Power BI filters to explore customer groups and demographic patterns.

 5. Customer Services and Billing Analysis

- Analysed churn across additional customer services and billing patterns.
- Used SQL with CTEs and UNION ALL for the analysis.

🔍 High-Risk Customer Insights

The combined analysis identified a customer segment with a high churn rate.

Customer Segment

- Contract: Month-to-Month
- Internet Service: Fiber Optic
- Payment Method: Electronic Check
- Tenure Group: 1 Year
- Monthly Charge Range: 75 or above

 Key Metrics

| Metric | Value |
|---|---:|
| Total Customers | 445 |
| Churned Customers | 323 |
| Retained Customers | 122 |
| Churn Rate | 72.58% |

 Key Finding

This customer segment had a churn rate of 72.58%, compared with the overall churn rate of 26.58%.

The analysis helped identify a customer group with a much higher churn rate that may need more attention from the business.

 🎛️ Interactive Power BI Filters

Added filters for:

- Contract
- Internet Service
- Payment Method
- Monthly Charge Range
- Tenure Group

These filters help explore different customer segments and demographic patterns.

📌 Conclusion

The project helped identify customer groups with higher churn rates and understand churn patterns across contracts, customer demographics, services and billing.

## 📸 POWER BI DASHBOARD SCREENSHOTS

### 1. CUSTOMER CHURN OVERVIEW
<img width="634" height="367" alt="Customer Churn Overview" src="https://github.com/user-attachments/assets/497a7926-8c0f-4eb6-90e8-9a6bc55ef3a0" />
 />
### 2. CONTRACT AND CUSTOMER SEGMENTATION ANALYSIS
<img width="634" height="365" alt="Contract and Customer Segmentation Analysis" src="https://github.com/user-attachments/assets/3d19ceec-4bae-4a24-baa5-da5c626f565b" />
### 3. HIGH-RISK CUSTOMER SEGMENTATION USING COMBINED FACTORS
<img width="635" height="367" alt="High Risk Customer Segmentation using combined factors" src="https://github.com/user-attachments/assets/6866cfe9-0de8-4f79-be32-8ce17d86b732" />
### 4. CUSTOMER DEMOGRAPHICS ANALYSIS
<img width="638" height="365" alt="Customer Demographics Analysis" src="https://github.com/user-attachments/assets/03c7bbd0-5811-4b86-8032-60b3829ec626" />
### 5. CUSTOMER SERVICES AND BILLING ANALYSIS
<img width="634" height="369" alt="Customer Services and Billing Analysis" src="https://github.com/user-attachments/assets/cfd2cf1b-2efe-45bf-ad76-6a9f4e895495" />


