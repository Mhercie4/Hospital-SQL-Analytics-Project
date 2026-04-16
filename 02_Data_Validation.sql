/* Project: Hospital Analytics Portfolio
Script: 02_Data_Validation
Description: Verifying that all CSV files imported with the correct row counts.
*/

USE Hospital_Portfolio_DB;
GO

SELECT 'Patients' AS TableName, COUNT(*) AS Row_Count FROM patients
UNION ALL
SELECT 'Organizations', COUNT(*) FROM organizations
UNION ALL
SELECT 'Payers', COUNT(*) FROM payers
UNION ALL
SELECT 'Procedures', COUNT(*) FROM procedures
UNION ALL
SELECT 'Encounters', COUNT(*) FROM encounters;