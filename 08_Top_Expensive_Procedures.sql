/* Project: Hospital Analytics Portfolio
Script: 08_Top_Expensive_Procedures
Description: Identifies the top 5 most expensive procedures by average base cost.
This helps the hospital identify high-value services and resource allocation.
*/

USE Hospital_Portfolio_DB;
GO

SELECT TOP 5
    Description,
    COUNT(*) AS Total_Performed,
    ROUND(AVG(BASE_COST), 2) AS Avg_Cost,
    ROUND(SUM(BASE_COST), 2) AS Total_Revenue
FROM procedures
GROUP BY Description
ORDER BY Avg_Cost DESC;