# 📊 IBM Telco Customer Churn Insights Dashboard

## 📌 Overview

This project presents an interactive Customer Churn Analysis Dashboard built using SQL and Power BI with the IBM Telco Customer Churn dataset. It analyzes customer behavior to identify churn patterns across contract types, internet services, tenure, monthly charges.

The dashboard helps understand which customer segments have higher churn rates and supports data-driven customer retention decisions.

## 🎯 Objectives

- Analyze overall customer churn trends.
- Identify customer segments with higher churn rates.
- Examine churn patterns across contract types and internet services.
- Analyze customer tenure and monthly charge patterns.
- Explore differences between churned and retained customers.
- Enable interactive analysis through Power BI filters.

## 🛠️ Tools & Technologies

- SQL (MySQL) – Data cleaning, transformation, and customer churn analysis.
- Power BI Desktop – Data visualization and interactive dashboard development.
- DAX – Creating measures for customer counts, churn rate, average monthly charges, and average tenure.

## 📂 Dataset

- Source: Kaggle – IBM Telco Customer Churn Dataset.


## 📊 Key Metrics

- Total Customers: 7,032
- Churned Customers:1,869
- Churn Rate: 26.58%
- Average Monthly Charges: 64.80
- Average Tenure: 32.42 months

## 📈 Dashboard Features

### 🔹 Customer Churn Overview

- Total customers and churned customers.
- Overall churn rate.
- Average monthly charges and average tenure.
- Churn analysis across contract types, internet services, and payment methods.

### 🔹 Churn by Contract Type

- Month-to-Month
- One Year
- Two Year

**Insight:** Month-to-Month contracts recorded the highest churn rate of 42.71%, with 1,655 churned customers out of 3,875.

### 🔹 Churn by Internet Service

- Fiber Optic
- DSL
- No Internet Service

**Insight:** Fiber Optic customers had a churn rate of 41.89%, with 1,297 churned customers out of 3,096.

### 🔹 Customer Tenure Analysis

- Analyze customer tenure distribution.
- Identify churn patterns among customers with different lengths of service.

**Insight:** Customers with 1–12 months of tenure had a churn rate of 47.68%, with 1,037 churned and 1,138 retained customers out of 2,175.

### 🔹 Monthly Charges Analysis

- Analyze average monthly charges.
- Examine monthly charge patterns among churned and retained customers.



### 🔹 Interactive Filters
- Gender
- Contract Type
- Internet Service
- Tenure_group

Power BI filters were also used to investigate churn among new customers (1–12 months), identifying churn rates of 51.35% for Month-to-Month contracts and 69.88% for Fiber Optic service.

## 💡 Key Insights

- Month-to-Month contracts recorded the highest churn rate among contract types.
- Fiber Optic customers showed a higher churn rate than the overall customer base.
- Customers with 1–12 months of tenure had a higher churn rate than the overall customer base.
- New customers using Month-to-Month contracts and Fiber Optic service showed particularly high churn rates in the filtered analysis.


## 📌 Conclusion

The analysis highlights differences in customer churn across contract types, internet services, and tenure. The findings suggest that businesses should pay particular attention to early customer experience, review contract options, and investigate service-related customer concerns to improve retention.

## 🚀 Future Enhancements

- Develop a customer churn prediction model using Machine Learning.
- Perform deeper customer segmentation analysis.
- Explore additional factors influencing customer churn.

## 📂 Project Files

- SQL scripts – Data cleaning and analysis.
- Power BI dashboard (.pbix) – Interactive dashboard.
- Dataset – IBM Telco Customer Churn Dataset.
- README.md – Project documentation.

## 🧾 Usage

1. Download or clone this repository.
2. Import the cleaned dataset into MySQL or use the provided SQL scripts.
3. Open the Power BI (.pbix) file using Power BI Desktop.
4. Use the interactive filters to explore customer churn patterns.
5. Navigate through the dashboard pages to understand the findings.
