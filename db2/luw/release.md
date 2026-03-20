
# Db2 Database SaaS on IBM Cloud

Lite tier

- Serverless trial configuration with single schema
- only available in London and Dallas regions
- 200 MB storage

# Genies Hub: the AI plugin

- Genies Hub has backport compatibility
  - unlike Oracle 23ai which force you to upgrade to get benefit
  - It can link to any supported DB2 edition
- Genies Hub is a standalone installable outside database

# Community Edition

released in 2019 June 27

- [annoucement](https://www.ibm.com/new/announcements/ibm-db2-developer-community-edition)
- replacement of DB2 Express-C
- Resource limits: 4 CPU cores, 16 GB Memory

downloads v12.1.4
- [for windows](
https://objectstorage.ap-singapore-1.oraclecloud.com/n/cn9yc2hk0gzg/b/install-binary/o/ibm%2Fdb2%2Fwin%2Fv12.1.4_ntx64_server_dec.zip)
- [for linux](
https://objectstorage.ap-singapore-1.oraclecloud.com/n/cn9yc2hk0gzg/b/install-binary/o/ibm%2Fdb2%2Flinux%2Fv12.1.4_linuxx64_server_dec.tar.gz)

connect
- user: db2admin
- port: 25000

## install
典型安装：2369 MB
精简安装：2285 MB

要验证您的安装文件、实例和数据库功能，请运行验证工具
- `& "C:\Program Files\IBM\SQLLIB\bin\db2val.exe"`



# DB2 Express-C

- born in 2006 Jan 30
- last release: 11.1 (2016)
- Resource limits: 2 CPU core, 16 GB RAM
