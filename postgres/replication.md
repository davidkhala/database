# PostgreSQL replication slot
It ensures the master server keeps the WAL logs required by replicas even when the replica are disconnected from the master.
- Due to replication is streaming based
- Checkpoint and playback：If the standby goes down, the master can keep track of how much the standby lags and preserve the WAL files it requires until the standby reconnects. The WAL files are then decoded and played back on the duplicate.


