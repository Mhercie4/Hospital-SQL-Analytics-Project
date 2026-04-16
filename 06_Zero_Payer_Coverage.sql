/* Project: Hospital Analytics Portfolio
Script: 06_Zero_Payer_Coverage
Description: How many encounters had zero payer coverage? 
This identifies the volume of self-pay visits or uncompensated care.
*/

USE Hospital_Portfolio_DB;
GO

SELECT 
    CASE 
        WHEN PAYER_COVERAGE = 0 THEN 'Zero Coverage'
        ELSE 'Some Coverage'
    END AS Coverage_Status,
    COUNT(*) AS Encounter_Count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS Percentage_of_Total
FROM encounters
GROUP BY 
    CASE 
        WHEN PAYER_COVERAGE = 0 THEN 'Zero Coverage'
        ELSE 'Some Coverage'
    END;