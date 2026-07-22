# Microsoft ODBC Driver {version} for SQL Server
latest LTS: 18
## On Windows
For windows
- Microsoft Visual C++ Redistributable
- [msi (x64)](https://go.microsoft.com/fwlink/?linkid=2358430)
## On Linux

[guide](https://learn.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server)
- [Ubuntu](https://github.com/davidkhala/ubuntu-utils/blob/master/database/mssql/install.sh)
- [RHEL]()

## On macOS
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew tap microsoft/mssql-release https://github.com/Microsoft/homebrew-mssql-release
brew update
HOMEBREW_ACCEPT_EULA=Y brew install msodbcsql18 mssql-tools18
```

[guide](https://learn.microsoft.com/en-us/sql/connect/odbc/linux-mac/install-microsoft-odbc-driver-sql-server-macos)

Limit
- Apple ARM64 support was added starting with version 17.8





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
