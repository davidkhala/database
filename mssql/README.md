# MicroSoft SQL server
default port 1433
## lifecycle
5 years in mainstream support
- Mainstream support includes functional, performance, scalability, and security updates

5 years in extended support 
- Extended support includes only security updates.

## Multi-tenant: Instance
named instances (Oracle PDB)
- You can install multiple named instances on the same host, each with its own configuration (port, mssql server version, collations, startup options) and security settings (service accounts)
- SQL Server uses the SQL Server Browser service to dynamically assign ports to named instances

default instance (Oracle CDB)

## Legacy download

[2017 developer](https://download.microsoft.com/download/5/A/7/5A7065A2-C81C-4A31-9972-8A31AC9388C1/SQLServer2017-SSEI-Dev.exe)

[Download SQL Server Management Studio (SSMS) 20.1](https://aka.ms/ssmsfullsetup)

## Related 
- [MS SQL in Azure](https://github.com/davidkhala/azure-utils/tree/main/data/sql)
- [Cheat sheet](https://therootcompany.com/blog/mssql-cheat-sheet/#:~:text=MS%20SQL%20Server%20Cheat%20Sheet%201%20Install%20MS,Port%20Forward%205%20Backups%20CIFS%20Backup%20CSV%20Export)
