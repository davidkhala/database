# PolyBase: the big data connector for mssql
处理往大数据系统中读写数据的 Transact-SQL 查询

适配支持
- Hadoop
  - 不要求在 Hadoop 环境中安装其他软件
  - 查询优化器会将计算推送到 Hadoop，并创建MapReduce job
- Azure Blob
- Azure Data Lake Store
- 以上系统中的半结构化数据如csv

# Limit
> PolyBase can't load rows that have more than 1,000,000 bytes of data
