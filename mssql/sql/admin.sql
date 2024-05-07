-- All tables across all databases:
SELECT *
FROM information_schema.tables

-- enable SA
ALTER LOGIN [sa] ENABLE

-- change SA password
ALTER LOGIN [sa] WITH PASSWORD='newpassword', CHECK_POLICY=OFF
