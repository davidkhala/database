-- show databases 
SELECT datname FROM pg_database 
WHERE datistemplate = false; -- excluding template tables `template0` and `template1`
