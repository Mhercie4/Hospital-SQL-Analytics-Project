/* Project: Hospital Analytics Portfolio
Script: 07_Avg_Coverage_by_Class
Description: What is the average amount paid by insurance (payer) for each type of visit?
This helps the hospital understand which services are most profitable or best covered.
*/

USE Hospital_Portfolio_DB;
GO

SELECT 
    EncounterClass,
    ROUND(AVG(PAYER_COVERAGE), 2) AS Avg_Payer_Coverage,
    ROUND(AVG(BASE_ENCOUNTER_COST), 2) AS Avg_Base_Cost,
    -- We also calculate the difference to see how much the patient might owe on average
    ROUND(AVG(BASE_ENCOUNTER_COST - PAYER_COVERAGE), 2) AS Avg_Patient_Responsibility
FROM encounters
GROUP BY EncounterClass
ORDER BY Avg_Payer_Coverage DESC;