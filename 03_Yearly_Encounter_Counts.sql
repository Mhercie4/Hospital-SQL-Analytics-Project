/* Project: Hospital Analytics Portfolio
Script: 03_Yearly_Encounter_Counts
Description: How many total encounters occurred each year?
*/

USE Hospital_Portfolio_DB;
GO

SELECT 
    YEAR(CONVERT(DATETIME2, LEFT(START, 19), 126)) AS EncounterYear,
    COUNT(*) AS TotalEncounters
FROM encounters
GROUP BY YEAR(CONVERT(DATETIME2, LEFT(START, 19), 126))
ORDER BY EncounterYear;