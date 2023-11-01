https://github.com/GoogleCloudPlatform/community/blob/master/archived/setting-up-postgres-hot-standby.md

In Hot Standby mode, the system employs two or more servers:
- A primary server runs the active database. This database accepts connections from clients and permits read-write operations.
- One or **more** standby servers run a copy of the active database. These databases are configured to accept connections from clients and permit read-only operations. If the primary database server fails, the system can fail over to the standby server, which makes the standby server the active primary server.
