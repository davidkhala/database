# Windows install
1. [SSMS] configure `Server authentication` (Restart mssql required.)
  0. select SQL server instance, and right click to pop drop down menu
  1. Menu item `Properties` -> `Security` -> select option `SQL Server and Windows Authentication mode`
2. [SSMS] Enable root account `sa`
  0. Expand folders of SQL server instance (Restart mssql required.)
  1. `Security` -> `Logins` -> `sa` -> menu item `Properties`.
  2. `Select a page`/`Status`: check `Enabled` in `Settings`/`Login` section
  3. Disable `Enforce password policy` and change password here.
  
  
3. [SQL Server {version} Configuration Manager] expose TCP/IP endpoint
  1. `SQL Server Network Configuration`/ `Protocols for MSSQLSERVER`
  2. In the right window change the `TCP/IP` option to `Enabled`.
4. [expose windows firewall](https://www.nickedeye.com/sql-server-2016-allow-remote-connection-installed-on-windows-server-2016/)