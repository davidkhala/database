-- All tables across all databases:
SELECT *
FROM information_schema.tables

-- show databases
SELECT name, create_date
FROM sys.databases
  
-- enable SA
ALTER LOGIN [sa] ENABLE

-- change SA password
ALTER LOGIN [sa] WITH PASSWORD='newpassword', CHECK_POLICY=OFF
