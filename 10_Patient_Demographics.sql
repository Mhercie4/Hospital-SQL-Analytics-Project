/* Project: Hospital Analytics Portfolio
Script: 10_Patient_Demographics
Description: Breakdown of patients by Gender and Age Group.
Calculating age from BIRTHDATE to understand the patient population's life stage.
*/

USE Hospital_Portfolio_DB;
GO

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
GROUP BY GENDER, 
    CASE 
        WHEN Age < 18 THEN 'Under 18'
        WHEN Age BETWEEN 18 AND 35 THEN '18-35'
        WHEN Age BETWEEN 36 AND 50 THEN '36-50'
        WHEN Age BETWEEN 51 AND 65 THEN '51-65'
        ELSE '65+'
    END
ORDER BY Age_Group, GENDER;