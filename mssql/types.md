# Data Types

推荐使用

类型 | 用途
-- | --
int | 常规整数、主键首选
bigint | 超大整数、Snowflake ID等
smallint | 小范围整数（-32768~32767），省空间时用
tinyint | 极小整数（0~255），如状态码
bit | 布尔值 0/1
decimal(18,10) / decimal(18,0) | 精确小数，金额、坐标必用
nvarchar(50) / nvarchar(MAX) | Unicode字符串首选，支持中文
varchar(50) / varchar(MAX) | 纯ASCII字符串，省空间
date | 只需日期，不需时间
datetime2(7) | 时间戳首选，精度高、范围大
time(7) | 只需时间，不需日期
datetimeoffset(7) | 需要时区信息时使用
varbinary(50) / varbinary(MAX) | 二进制数据、文件存储
uniqueidentifier | GUID，分布式系统主键
float / real | 科学计算，不要用于金额（精度问题）

谨慎使用

类型 | 问题 | 替代方案
-- | -- | --
datetime | 精度低（3.33ms舍入）、范围从1753年 | datetime2(7)
smalldatetime | 只精确到分钟，范围到2079年 | datetime2(0)
timestamp | 名字误导，实际是行版本号，不是时间 | datetime2
money / smallmoney | 有精度陷阱，运算可能丢失精度 | decimal(19,4)
nchar(10) / char(10) | 固定长度，短数据浪费空间 | nvarchar(n)
numeric | 功能同 decimal，二者等价 | 统一用 decimal

## real
alias for float(24)
- 单精度float: 4 bytes


## varchar
电话号码:varchar(20)
