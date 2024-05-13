# Windows install
1. configure `Server authentication` by SSMS
  - `Server Properties` -> `Security` -> select option `SQL Server and Windows Authentication mode`
2. enable root account `sa`
  1. Drop down -> `Security` -> `Logins` -> `sa` -> menu item `Properties`.
  2. Disable `Enforce password policy` and change password here.
  3. Restart mssql required.
  
3. expose TCP/IP endpoint by `SQL Server Configuration Manager`.
- select the instance that you want to allow access to under the `SQL Server Network Configuration` drop down
- In the right window change the `TCP/IP` option to `Enabled`.
4. [expose windows firewall](https://www.nickedeye.com/sql-server-2016-allow-remote-connection-installed-on-windows-server-2016/)