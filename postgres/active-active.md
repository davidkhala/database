# History
BDR deprecate
- PostgreSQL version 9.6, released in 2016, included a community extension called BDR that had some initial bidirectional replication support. The BDR extension was not updated or maintained in subsequent versions of PostgreSQL
# Providers

## Asynchronous replica
[Bucardo](https://wiki.postgresql.org/wiki/Bucardo)
- ref: https://developer.ibm.com/tutorials/configure-postgresql-active-active-replication-bucardo/
- Asynchronous master-master replication, row-based, using triggers and customized conflict resolution

[Spock](https://github.com/pgEdge/spock)
- ref: https://www.redhat.com/architect/postgresql-multiactive-database
- by pgEdge.com


[EDB replication products](https://www.enterprisedb.com/products/replication)
1. EPRS [EDB Replication Server](https://www.enterprisedb.com/docs/eprs/latest/)
    - https://www.enterprisedb.com/docs/eprs/latest/06_mmr_operation/
    - Asynchronous replication
