
trigger
- Dataset size (percentage of memory limit)
- Throughput (RPS)
- Latency (milliseconds)
- Periodic backup delay (minutes)
- Long-running actions (hours)

endpoint
- for Prometheus: 8070
- for Rest API: 9443

slow log
- `SLOWLOG LEN`: count current logs
- `SLOWLOG GET [n]`: tail latest n records (default n=10)