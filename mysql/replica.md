主从复制的线程
on master
- Binlog Dump Thread: 将主库 binlog 内容发送给从库

on slave
- I/O Receiver Thread: 连接主库，接收 binlog，并写入 relay log
- SQL Applier Thread: 读取 relay log 并执行其中的事务

# commands
on master
- `SHOW MASTER STATUS`

on slave
- `SHOW REPLICA STATUS\G`