# 📊 Customer Churn Prediction & Analysis

End-to-end customer churn analytics solution using Python, MySQL, Power BI, and optional predictive modeling to identify churn patterns, customer segments, and revenue at risk.

## 📌 Business Problem

Customer churn directly impacts business revenue and customer lifetime value. Without a centralized analytics solution, it is difficult to identify churn patterns, understand customer behavior, and prioritize retention strategies.

This project addresses these challenges by analyzing customer demographics, contract details, services, and billing information to identify key churn drivers. The solution combines Python for data preprocessing, MySQL for star schema modeling and business analysis, Power BI for interactive dashboards, and predictive modeling to support customer retention decisions.

---

## 💡 Solution Overview

Developed an end-to-end customer churn analytics solution that transforms raw Telco customer data into actionable business insights. The solution leverages **Python** for data preprocessing and transformation, **MySQL** for star schema modeling and analytical SQL queries, and **Power BI** for interactive dashboard development. It enables stakeholders to monitor churn trends, analyze customer segments, identify key churn drivers, and support data-driven customer retention strategies. Additionally, **Logistic Regression** and **Random Forest** models were developed to evaluate customer churn prediction performance.

## 🛠️ Tech Stack

* **Python** (Pandas, NumPy, Scikit-learn)
* **MySQL** (Star Schema, Advanced SQL)
* **Power BI** (Dashboard & Visualization)
* **Jupyter Notebook**

---

## 📁 Project Structure

```
customer-churn-project/
│
├── data/
│   ├── raw/
│   │   └── telco_churn.csv
│   ├── cleaned/
│       └── cleaned_telco_churn.csv
│
├── notebook/
│   ├── data_cleaning.ipynb
│   ├── model_building.ipynb
│
├── sql/
│   ├── schema.sql
│   ├── churn_analysis.sql
│
├── dashboard/
│   └── churn_dashboard.pbix
│
└── README.md
```

---

## 🛠️ Technology Stack

| Technology | Purpose |
|------------|---------|
| **Python** | Data cleaning, preprocessing, feature engineering, and predictive modeling |
| **Pandas & NumPy** | Data transformation and exploratory data analysis |
| **MySQL** | Star schema data modeling and analytical SQL queries |
| **Power BI** | Interactive dashboards, DAX measures, and data visualization |
| **Scikit-learn** | Logistic Regression and Random Forest model development and evaluation |
| **Git & GitHub** | Version control and project documentation |

### 4️⃣ SQL Data Modeling

* Created **Star Schema**

  * Fact Table: `fact_churn`
  * Dimension Tables: `dim_customer`, `dim_contract`, `dim_services`
* Performed advanced SQL analysis:

  * Churn rate calculation
  * Customer segmentation
  * Revenue at risk
  * Cohort analysis

## 📂 Dataset Overview

| Attribute | Details |
|-----------|---------|
| **Dataset** | Telco Customer Churn Dataset |
| **Dataset Size** | 7,043 customer records |
| **Features** | 21 attributes |
| **Domain** | Telecommunications |
| **Target Variable** | Customer Churn (Yes/No) |
| **Key Features** | Customer Demographics, Tenure, Contract Type, Internet Service, Payment Method, Monthly Charges, Total Charges, Tech Support |

---
## 🔄 Project Workflow

1. **Data Collection** – Imported the Telco Customer Churn dataset and validated data quality.
2. **Data Preparation** – Cleaned missing values, standardized data types, encoded categorical variables, and created derived features using Python.
3. **Data Modeling** – Designed a Star Schema in MySQL with one fact table and three dimension tables to support analytical reporting.
4. **Business Analysis** – Performed SQL analysis to evaluate customer churn trends, revenue at risk, customer segmentation, and contract-based churn patterns.
5. **Dashboard Development** – Built an interactive Power BI dashboard using DAX measures, KPI cards, customer segmentation, churn driver analysis, and dynamic filters.
6. **Predictive Analytics** – Developed and evaluated Logistic Regression and Random Forest models to analyze customer churn prediction performance and identify key churn drivers.



## 📊 Dashboard Preview

The Power BI dashboard provides a comprehensive view of customer churn through KPI monitoring, churn driver analysis, customer segmentation, and retention insights. It enables stakeholders to identify high-risk customer groups, analyze churn patterns, and support data-driven customer retention strategies.

### 📌 Executive Summary

![Executive Summary](images/executive_summary.png)

### 📉 Churn Driver Analysis

![Churn Driver Analysis](images/churn_driver_analysis.png)

### 👥 Customer Segmentation

![Customer Segmentation](images/customer_segmentation.png)

### 💡 Insights & Retention

![Insights & Retention](images/insights_retention.png)




[![Dashboard](dashboard/dashboard.png)](dashboard/dashboard.png)


--- 
## 📈 Key KPIs

| KPI | Value |
|------|--------|
| **Total Customers** | **7043** |
| **Churned Customers** | **1869** |
| **Revenue at Risk** | **$139K** |
| **Churn Rate** | **26.54%** |


---
## 🔍 Key Insights

- Customers with **month-to-month contracts** recorded the highest churn, indicating that shorter contract commitments are strongly associated with customer attrition.
- Customers with **shorter tenure** were significantly more likely to churn than long-term customers, highlighting the importance of early customer engagement.
- Customers with **higher monthly charges** showed a greater tendency to churn, suggesting that pricing plays a key role in customer retention.
- Customers without **technical support** and **online security services** exhibited higher churn rates, emphasizing the impact of value-added services on customer loyalty.
- **Electronic Check** was one of the most common payment methods among churned customers, indicating potential differences in customer behavior across payment preferences.

- ## 💼 Business Recommendations

- Introduce **customer retention programs** for customers with month-to-month contracts to encourage migration to long-term plans.
- Strengthen **new customer onboarding and engagement initiatives** during the early months of the customer lifecycle to reduce early churn.
- Review pricing strategies and offer **personalized discounts or bundled service plans** for customers with higher monthly charges.
- Promote **value-added services** such as Technical Support and Online Security to improve customer satisfaction and reduce churn risk.
- Monitor high-risk customer segments through interactive Power BI dashboards and implement proactive retention strategies based on customer behavior.

- ## 🤖 Predictive Analytics

To complement the business analysis, **Logistic Regression** and **Random Forest** classification models were developed to evaluate customer churn prediction performance. The models were trained on the prepared dataset after data preprocessing and feature engineering.

### Model Performance

| Metric | Logistic Regression | Random Forest |
|--------|--------------------:|--------------:|
| **Accuracy** | **80.9%** | **78.9%** |
| **Precision** | **66.9%** | **63.4%** |
| **Recall** | **55.6%** | **48.7%** |
| **ROC-AUC** | **72.8%** | **69.3%** |

### Key Findings

- **Logistic Regression** achieved the best overall performance across Accuracy, Recall, and ROC-AUC, making it the preferred model for this dataset.
- **Random Forest** feature importance identified **Total Charges**, **Tenure**, and **Monthly Charges** as the strongest predictors of customer churn.
- The predictive results supported the business insights obtained through SQL analysis and Power BI dashboards, reinforcing the key factors influencing customer churn.

## 🎯 Skills Demonstrated

- Exploratory Data Analysis (EDA)
- Data Cleaning & Feature Engineering
- Customer Segmentation
- Star Schema Data Modeling
- Advanced SQL Analysis
- Power BI Data Modeling & DAX
- Interactive Dashboard Development
- Business Intelligence & Data Visualization
- Customer Churn Analysis
- Predictive Analytics using Logistic Regression & Random Forest

## 📁 Repository Structure

```text
Customer-Churn-Analysis/
│
├── data/
│   ├── raw/
│   │   └── telco_customer_churn.csv
│   └── processed/
│       └── cleaned_customer_churn.csv
│
├── notebooks/
│   ├── data_cleaning_and_eda.ipynb
│   └── churn_prediction_models.ipynb
│
├── sql/
│   ├── create_star_schema.sql
│   └── churn_business_analysis.sql
│
├── dashboard/
│   └── customer_churn_dashboard.pbix
│
├── images/
│   ├── executive_summary.png
│   ├── churn_driver_analysis.png
│   ├── customer_segmentation.png
│   ├── insights_retention.png
│   └── solution_architecture.png
│
└── README.md

```

