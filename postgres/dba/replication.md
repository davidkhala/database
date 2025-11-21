# Streaming Replication
[percona blog](https://www.percona.com/blog/setting-up-streaming-replication-postgresql/)


### config: `max_replication_slots`
PostgreSQL replication slot ensures the master server keeps the WAL logs required by replicas even when the replica are disconnected from the master.
- Due to replication is streaming based
- Checkpoint and playback：If the standby goes down, the master can keep track of how much the standby lags and preserve the WAL files it requires until the standby reconnects. The WAL files are then decoded and played back on the duplicate.


[max_wal_senders >= max_replication_slots + others (e.g. # of physical replicas)](https://www.keisuke.dev/memo/postgresql/2020-12-24-intro_logical_replication.html)
