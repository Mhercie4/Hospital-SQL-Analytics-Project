/* Project: Hospital Analytics Portfolio
Script: 05_Visit_Duration_Analysis
Description: What percentage of encounters were over 24 hours versus under 24 hours?
This helps distinguish between short outpatient visits and long-term inpatient stays.
*/

USE Hospital_Portfolio_DB;
GO

SELECT 
    CASE 
        WHEN DATEDIFF(HOUR, 
            CONVERT(DATETIME2, LEFT(START, 19), 126), 
            CONVERT(DATETIME2, LEFT(STOP, 19), 126)) >= 24 THEN 'Over 24 Hours'
        ELSE 'Under 24 Hours'
    END AS Visit_Duration_Category,
    COUNT(*) AS Encounter_Count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS Percentage
FROM encounters
GROUP BY 
    CASE 
        WHEN DATEDIFF(HOUR, 
            CONVERT(DATETIME2, LEFT(START, 19), 126), 
            CONVERT(DATETIME2, LEFT(STOP, 19), 126)) >= 24 THEN 'Over 24 Hours'
        ELSE 'Under 24 Hours'
    END;