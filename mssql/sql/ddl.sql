-- Show definition queries
-- option 1: no linebreaks
SELECT definition
FROM sys.sql_modules
WHERE object_id = OBJECT_ID('SalesLT.vProductAndDescription');

-- option 2: similar to option 1
SELECT OBJECT_DEFINITION (OBJECT_ID('SalesLT.vProductAndDescription'))
-- option 3: multiple rows simulating code block with linebreaks. 
EXEC sp_helptext 'SalesLT.vProductAndDescription'; 
