
# Db2 Database SaaS on IBM Cloud

Lite tier

- Serverless trial configuration with single schema
- only available in London and Dallas regions
- 200 MB storage

# IBM Data Server Driver Package (DSDriver)

Download

1. Goto [Fix Central](https://www.ibm.com/support/fixcentral)
2. select Product Group: `Information Management`
3. select Product: `IBM Data Server Client Packages`
4. select Recommended Group `DSClients-115-ntx64-RECOMMENDED`
5. download dsdriver installer like `v11.5.9_ntx64_dsdriver_ALL_LANG.exe`

# IBM Db2 Datalake Tables

讓 Db2 能直接訪問 Object Storage

- DML通過Copy-on-Write的方式，產生新 data file
  - 不是 Row-level OLTP
