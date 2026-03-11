

# SPL

Informix 的 SPL 是行业内最强的存储过程语言之一
- 执行效率，轻量化，批处理模型上优于Oracle PL/SQL
- 轻量化：运行在引擎内部，没有复杂的执行栈（如PL/SQL 的 interpreter层）
- 批处理模型：基于page-level locking 和 row-level locking技术，在批处理和OLTP共存时更稳定，冲突和锁更少
- 执行效率：事务开销极低。直接操作page buffer，直接使用Informix的日志结构
