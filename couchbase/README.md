
# Bucket
- similar to database / schema level
- aka. **keyspace**

Types
- `Couchbase`: store data persistently, as well as in memory (default type)
  - If a Couchbase bucket's RAM-quota is exceeded, items are *ejected* from memory. Then data will only reside in disk
- `Ephemeral`
- `Memcached`


Limit
- > A maximum of 30 buckets can be created in a cluster


## Bucket/Scope
introduced in CouchBase 7.0

scope: `_default` contains a `_default` collection

scope `_system` contains default collections

- collection `_mobile`
- collection `_query`

Indexes are defined under scope

### Bucket/Scope/Collection
- similar to table or document level

# Cross-Data Center Replication (XDCR)
> Use of cross-data center replication is not permitted by the Couchbase Community Edition license since Couchbase Server 7.0
- [Paid feature since June 30, 2021](https://www.couchbase.com/blog/couchbase-modifies-license-free-community-edition-package/)