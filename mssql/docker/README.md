# Windows Developer Edition image
> SQL Server on Windows Containers isn't supported for production workloads. ---- microsoft
- [source](https://github.com/Microsoft/mssql-docker/tree/master/windows/mssql-server-windows-developer)
- > As Microsoft doesn't seem to be publishing up to date versions of the image.
  - [community fork release](https://hub.docker.com/r/octopusdeploy/mssql-server-windows-express)
- version lag: latest up-to 2017
  - > You can currently sign-up for SQL Server 2019 on Windows Containers available in [Early Adopter Preview program](https://www.microsoft.com/en-us/sql-server/blog/2019/07/01/sql-server-2019-on-windows-containers-now-in-early-adopters-program/)

# Microsoft SQL Server - Ubuntu based images
[DockerHub](https://hub.docker.com/r/microsoft/mssql-server)
## Config
- Password policy: At least 8 characters including uppercase, lowercase letters, base-10 digits and/or non-alphanumeric symbols.
- At least 2GB of RAM

Environment Variables
- `MSSQL_PID` is the Product ID (PID) or Edition that the container will run with. (default: `Developer`)
  - Other acceptable values: `Express`, `Standard`, `Enterprise`, `EnterpriseCore`



