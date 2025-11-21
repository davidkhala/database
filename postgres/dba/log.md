https://blog.csdn.net/Post_Yuan/article/details/128735936

- PostgreSQL没有UNDO日志，也没有BINLOG
# 预写日志WAL
WAL与REDO差不多，当事务提交时WAL会先落盘。当数据库崩溃恢复时，使用WAL日志来恢复数据。

MVCC实现：PostgreSQL中的多版本并发是通过在表中数据行的多个版本来实现的，比如我们在更新一条记录，PostgreSQL并不是直接修改该数据，而是通过插入一条全新的数据，同时对老的数据加以标识。
- 因此，PostgreSQL中通常需要定期对数据进行清理动作(vacuum)，否则会有数据膨胀的问题。
