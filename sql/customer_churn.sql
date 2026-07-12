-- ------------------------------------------------------------------------------------------------------------------------
# Create Star Schema and finding Insights of customer_churn
-- ------------------------------------------------------------------------------------------------------------------------
# Step1: Create databse and use it 

CREATE DATABASE churn_project;
use churn_project;

-- ------------------------------------------------------------------------------------------------------------------------
# Step 2 : Create Star Schema

# 1) Create fact_churn table 
CREATE TABLE fact_churn as 
select customer_id,tenure,monthly_charges,total_charges,churn 
from cleaned_telco_churn;

# 2) Create dimension tables 
# A) Create dim_customer 
create table dim_customer as 
select distinct customer_id,gender,senior_citizen,partner,dependents 
from cleaned_telco_churn;

# B ) Create dim_contract 
create table dim_contract as 
select distinct customer_id,contract,paperless_billing,payment_method
from cleaned_telco_churn;

# C) Create dim_service 
create table dim_service as 
select distinct customer_id,internet_service,online_security,online_backup,
				device_protection,tech_support,streamingtv,streaming_movies
from cleaned_telco_churn;

# Validate data in table 
select * from fact_churn limit 5;
select * from dim_customer limit 5;
select * from dim_contract limit 5;
select * from dim_service limit 5;

-- ------------------------------------------------------------------------------------------------------------------------
# Step 3: Finding Insights from data

#  1) Overall Churn Rate 
select count(*) as total_customers,
       sum(churn) as churned_customers,
       round(sum(churn) * 100.0/count(*),2) as churn_rate 
from fact_churn;
select * from fact_churn;

# 2) Contract Based Churn

select dc.contract,count(*) as total_customers,
	   sum(f.churn) as churned ,
       round(sum(f.churn)*100.0/count(*),2) as churn_rate
from 
    fact_churn f join dim_contract dc on f.customer_id=dc.customer_id
group by dc.contract 
order by churn_rate desc;

# 3) finding revenue at risk and risk percentage 

select 
   round(sum(monthly_charges),2) as total_revenue,
   round(sum(case when churn=1 then monthly_charges else 0 end ),2) as revenue_at_risk,
   round(sum(case when churn=1 then monthly_charges else 0 end) * 100.0 / sum(monthly_charges),2) as risk_percentage
   from fact_churn;
   
# 4) Customer Lifetime Value 
SELECT  customer_id,tenure,monthly_charges,
       round((tenure * monthly_charges),2) AS estimated_clv
FROM fact_churn
ORDER BY estimated_clv DESC
LIMIT 10;
-- Insight : Identify high-value customers to prioritize retention 


# 5)  Churn rate trend by Tenure 
SELECT tenure, COUNT(*) AS total_customers, SUM(churn) AS churned,
        ROUND(SUM(churn)*100.0/COUNT(*),2) AS churn_rate,
        AVG(SUM(churn)) OVER(ORDER BY tenure ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)  AS moving_avg_churn
FROM fact_churn
GROUP BY tenure
ORDER BY tenure;
-- Insights : Detect churn trend as customer age 

-- 6) Rank High-Risk Customers 
SELECT customer_id,monthly_charges,tenure,churn,
       RANK() OVER(ORDER BY monthly_charges DESC) AS charge_rank
FROM fact_churn
WHERE churn=1;
-- Insights : identify top revenue-loss customeres. 

# 7) Segment Customers 
SELECT customer_id,
      CASE 
        WHEN tenure<=12 AND monthly_charges>70 THEN 'High Risk'
        WHEN tenure<= 12 THEN 'Medium Risk'
        ELSE 'Low Risk'
	   END AS risk_segment 
FROM fact_churn;
-- Insights : Business segmentation for targeting campaigns 

# 8) Churn Contribution % by segment 
SELECT dc.contract,COUNT(*) AS total, SUM(f.churn) AS churned ,
      ROUND(SUM(f.churn)*100.0/SUM(SUM(f.churn)) OVER(),2) AS contribution_percentage
FROM fact_churn f JOIN dim_contract dc ON f.customer_id=dc.customer_id 
GROUP BY dc.contract;
-- Insights : getting the segment contributes most to churn

# 9) Retention Rate 
SELECT 
   ROUND((COUNT(*)-SUM(churn))* 100.0/COUNT(*),2) AS retention_rate 
FROM fact_churn;

# 10) Churn by Multi-Dimenstion 
SELECT dc.contract,ds.internet_service,ds.tech_support,ROUND(SUM(churn)*100.0/COUNT(*),2) AS churn_rate
FROM 
   fact_churn f JOIN dim_contract dc ON f.customer_id=dc.customer_id
                JOIN dim_service ds ON f.customer_id=ds.customer_id
GROUP BY dc.contract,ds.internet_service, ds.tech_support
ORDER BY churn_rate DESC ;

# 11)  Top 5 Risky Combination 
SELECT dc.contract, dc.payment_method,ds.internet_service,ROUND(SUM(churn)*100.0/COUNT(*),2) AS churn_rate
FROM 
   fact_churn f JOIN dim_contract dc ON f.customer_id=dc.customer_id
                JOIN dim_service ds ON f.customer_id=ds.customer_id
GROUP BY dc.contract, dc.payment_method, ds.internet_service 
HAVING COUNT(*)>50 
ORDER BY churn_rate DESC 
LIMIT 5;

# 12)  Cohort Analysis 
SELECT 
  CASE 
      WHEN tenure <= 12 THEN '0-1 Year' 
      WHEN tenure<=24 THEN '1-2 Years ' 
      ELSE '2+ Years'
  END AS cohort,
  COUNT(*) AS customers,
  SUM(churn) AS churned,
  ROUND(SUM(churn) * 100.0/COUNT(*),2) AS churn_rate 
  FROM fact_churn
  GROUP BY cohort;
  
  # 13) Predictive Insights 
  SELECT 
     customer_id,monthly_charges,tenure,
     CASE 
        WHEN monthly_charges>80 AND tenure < 12 THEN 'Likely to Churn'
	    ELSE 'Stable' 
	 END AS predicted_status
 FROM 
    fact_churn;
    
    select * from fact_churn where churn=1;