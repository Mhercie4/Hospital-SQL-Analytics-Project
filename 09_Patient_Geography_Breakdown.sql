/* Project: Hospital Analytics Portfolio
Script: 09_Patient_Geography_Breakdown
Description: Provides a count of unique patients per City and County.
This helps identify where the hospital's primary service area is located.
*/

USE Hospital_Portfolio_DB;
GO

SELECT 
    CITY, 
    COUNT(*) AS Patient_Count
FROM patients
GROUP BY CITY
ORDER BY Patient_Count DESC;

-- Bonus: Running the County count separately
SELECT 
    COUNTY, 
    COUNT(*) AS Patient_Count
FROM patients
GROUP BY COUNTY
ORDER BY Patient_Count DESC;