# Hospital Operations & Patient Demographics Analysis (SQL)

## **Project Overview**
This project involved building a relational database from scratch using synthetic hospital records. The goal was to analyze patient demographics, encounter trends, and the financial impact of medical procedures to provide actionable insights for hospital administration.

## **Project Objectives**

### **1. Operational Overview**
* To analyze the annual volume of hospital encounters and identify long-term trends.
* To determine the distribution of encounter classes (e.g., Ambulatory, Wellness, Emergency).
* To calculate the percentage of short-stay visits (under 24 hours) versus long-stay inpatient visits.

### **2. Financial & Coverage Insights**
* To identify the volume of encounters with zero insurance coverage (Self-Pay).
* To calculate the average payer coverage and base cost for different types of medical visits.
* To determine the top 5 most expensive medical procedures by average cost and total revenue.

### **3. Patient Demographics & Geography**
* To identify the primary geographic locations (Cities and Counties) where patients reside.
* To analyze the patient population by gender and age groups to understand the hospital's primary demographic.

---

## **Key Findings**
* **Hospital Efficiency:** 96.8% of all hospital visits were completed in under 24 hours, indicating the facility functions primarily as an outpatient hub.
* **Patient Demographics:** The majority of the patient population is aged 65 and older, suggesting a need to prioritize geriatric care.
* **High-Value Procedures:** "Admit to ICU" was identified as the most expensive procedure, with an average cost exceeding 200,000.
* **Patient Geography:** The city of Boston and Suffolk County represent the largest share of the hospital's patient base.

---

## **Technical Sample: Calculating Patient Age Groups**
To understand the demographic, I utilized a **CTE** and a **CASE statement** to bucket patients into life stages.

```sql
WITH PatientAge AS (
    SELECT 
        GENDER,
        DATEDIFF(YEAR, BIRTHDATE, GETDATE()) AS Age
    FROM patients
)
SELECT 
    GENDER,
    CASE 
        WHEN Age < 18 THEN 'Under 18'
        WHEN Age BETWEEN 18 AND 35 THEN '18-35'
        WHEN Age BETWEEN 36 AND 50 THEN '36-50'
        WHEN Age BETWEEN 51 AND 65 THEN '51-65'
        ELSE '65+'
    END AS Age_Group,
    COUNT(*) AS Patient_Count
FROM PatientAge
GROUP BY GENDER, Age_Group
ORDER BY Age_Group;
