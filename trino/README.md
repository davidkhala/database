
# Trino server
- Port: 8080

# Trino CLI
- The CLI is a self-executing JAR file
- The CLI uses the Trino client REST API over HTTP/HTTPS to communicate with the coordinator on the cluster.

Prerequisite
- The CLI requires a Java virtual machine(Java 8+) available on the path 
# [Web UI](https://trino.io/docs/current/admin/web-interface.html)
Trino provides a web-based user interface (UI) for monitoring a Trino cluster and managing queries
- Aka **Cluster Overview**
- Endpoint: `localhost:8080/ui/`
- Username: any input is allowed by default
