/* Project: Hospital Analytics Portfolio
Script: 04_Encounter_Class_Analysis
Description: Percentage of all encounters by class per year.
*/

USE Hospital_Portfolio_DB;
GO

WITH YearlyTotals AS (
    SELECT 
        YEAR(CONVERT(DATETIME2, LEFT(START, 19), 126)) AS EncounterYear,
        EncounterClass,
        COUNT(*) AS ClassCount
    FROM encounters
    GROUP BY YEAR(CONVERT(DATETIME2, LEFT(START, 19), 126)), EncounterClass
)
SELECT 
    EncounterYear,
    EncounterClass,
    ClassCount,
    ROUND(CAST(ClassCount AS FLOAT) * 100 / SUM(ClassCount) OVER(PARTITION BY EncounterYear), 2) AS PercentageOfTotal
FROM YearlyTotals
ORDER BY EncounterYear, PercentageOfTotal DESC;