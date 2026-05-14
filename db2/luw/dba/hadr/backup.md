

## incremental backup
DB2 的增量备份依赖 tablespace extent-level change map
- extent 颗粒度：4MB

判断哪些 extents 需要备份
- DB2 需要扫描表空间 extents + log chain
- 只要extent内一条记录变化，整个都会被标记为需要备份



### Optimize
reorg
- reorg: 整理表/索引碎片
  - 表碎片(data fragmentation) 来源：Delete 后留下的空洞(leaf page)，update后行变大导致row overflow，insert导致page split
  - 索引碎片来源：B-tree 不平衡
- reorg需要判断
  - `db2 reorgchk update statistics on table <schema.table>` 输出中是否含有REORG INDEX，REORG TABLE
  - 表的overflow rows多: `db2pd -db <DB> -tables`，判断结果中的Overflow和Pseudo Deleted Rows的高低
  - page split 多： `db2pd -db <DB> -indexes` 中出现的Split， Leaf pages
- 典型问题来源：批量删除(清理历史数据), ELT Truncate
- 典型reorg触发器
  - 定期: 每周进行 | 指定的高频更新大表
  - post batch delete
- 优先使用 INPLACE（在线）REORG
  - 注意不是完全无锁，需要超时保护才能避免卡死  
