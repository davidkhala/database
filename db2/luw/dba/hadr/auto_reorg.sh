#!/bin/bash
# ---------------------------------------------------------
# DB2 自动 REORGCHK + 自动 REORG 脚本
# 作者：宇翔（David Khala）
# ---------------------------------------------------------

DBNAME="$1"
if [ -z "$DBNAME" ]; then
  echo "用法: $0 <DBNAME>"
  exit 1
fi

LOGDIR="/var/log/db2reorg"
mkdir -p "$LOGDIR"
LOGFILE="$LOGDIR/reorg_$(date +%Y%m%d_%H%M%S).log"

echo "===== DB2 自动 REORG 开始 $(date) =====" | tee -a "$LOGFILE"

db2 connect to $DBNAME >> "$LOGFILE" 2>&1

# 生成 REORGCHK 输出
echo "[INFO] 运行 REORGCHK..." | tee -a "$LOGFILE"
db2 -x "REORGCHK CURRENT STATISTICS ON TABLE ALL" > /tmp/reorgchk.out

echo "[INFO] 分析 REORGCHK 输出..." | tee -a "$LOGFILE"

# 找出需要 REORG 的表
grep -E "TABLE:|REORG" /tmp/reorgchk.out | \
awk '
  /TABLE:/ {tbl=$2}
  /REORG/ {print tbl}
' | sort -u > /tmp/reorg_list.txt

if [ ! -s /tmp/reorg_list.txt ]; then
  echo "[INFO] 没有需要 REORG 的表" | tee -a "$LOGFILE"
  exit 0
fi

echo "[INFO] 以下表需要 REORG：" | tee -a "$LOGFILE"
cat /tmp/reorg_list.txt | tee -a "$LOGFILE"

echo "" | tee -a "$LOGFILE"

# 对每个表执行 REORG
while read -r TABLE; do
  echo "[INFO] 开始 REORG $TABLE ..." | tee -a "$LOGFILE"

  # 在线 REORG（INPLACE）
  CMD="REORG TABLE $TABLE INPLACE ALLOW WRITE ACCESS"

  echo "[INFO] 执行: $CMD" | tee -a "$LOGFILE"
  db2 "$CMD" >> "$LOGFILE" 2>&1

  # 如果在线 REORG 失败，尝试普通 REORG
  if [ $? -ne 0 ]; then
    echo "[WARN] 在线 REORG 失败，尝试离线 REORG $TABLE" | tee -a "$LOGFILE"
    db2 "REORG TABLE $TABLE" >> "$LOGFILE" 2>&1
  fi

  echo "[INFO] RUNSTATS $TABLE ..." | tee -a "$LOGFILE"
  db2 "RUNSTATS ON TABLE $TABLE WITH DISTRIBUTION AND SAMPLED DETAILED INDEXES ALL" >> "$LOGFILE" 2>&1

  echo "[INFO] 完成 $TABLE" | tee -a "$LOGFILE"
  echo "" | tee -a "$LOGFILE"

done < /tmp/reorg_list.txt

echo "===== DB2 自动 REORG 完成 $(date) =====" | tee -a "$LOGFILE"
