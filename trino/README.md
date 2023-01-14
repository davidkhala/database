
# Trino server
- Port: 8080

# Connect
``` Maven
<dependency>
    <groupId>io.trino</groupId>
    <artifactId>trino-jdbc</artifactId>
    <version>405</version>
</dependency>
```
- [jar](https://repo1.maven.org/maven2/io/trino/trino-jdbc/405/trino-jdbc-405.jar)
- ConnectionString template: `jdbc:trino://$host:8080/$catalog/$schema`
  - $catalog: `mongo|hive|minio`
  - Sample: `jdbc:trino://152.69.211.12:8080/hive/sales`
- JDBC class path: `io.trino.jdbc.TrinoDriver`



## Trino CLI
- The CLI is a self-executing JAR file
- The CLI uses the Trino client REST API over HTTP/HTTPS to communicate with the coordinator on the cluster.

Prerequisite
- The CLI requires a Java virtual machine(Java 8+) available on the path 
# [Web UI](https://trino.io/docs/current/admin/web-interface.html)
Trino provides a web-based user interface (UI) for monitoring a Trino cluster and managing queries
- Aka **Cluster Overview**
- Endpoint: `localhost:8080/ui/`
- Username: any input is allowed by default
