[Ref: REST API](https://docs.couchbase.com/server/current/rest-api/rest-intro.html)


# Bucket

- similar to database level
- aka. **keyspace**
- **Immutable**: cannot be renamed after provision

Types
> All bucket types are fully compatible with the Memcached open source distributed key-value cache.
- `Couchbase`: store data persistently, as well as in memory (default type)
  - If bucket's RAM-quota is exceeded, items are *ejected* from memory. Then data will only reside in disk
- `Ephemeral`
  - No persistence
  - highly consistent in-memory performance, without disk-based fluctuations
  - faster node rebalances and restarts
  - If bucket's RAM-quota is exceeded, either behavior can be configured when bucket-creation
    1. Resident data-items remain in RAM. Attempts to add data therefore fail.
    2. Resident data-items are *ejected* from RAM, to make way for new data. 
      - however, a `tombstone` is retained until the next scheduled purge of metadata for the current node
      - `tombstone` is a record of the ejected item, which includes keys and metadata

- `Memcached`: deprecated
  - designed to be used alongside other database platforms
  - only exist in RAM
  - If bucket's RAM-quota is exceeded, items are *ejected*

Shards
- aka. vBucket
- Within each Bucket are 1024 vBuckets. Spread out automatically and evenly only on Data nodes
- Sorted by hash value of Document key
- **Autonomous**: DBA don't need and cannot control

Limit
>
- > A maximum of 30 buckets can be created in a cluster

## Bucket/Scope

- similar to schema level
- introduced in CouchBase 7.0
- usecase: a scope as a single microservice
- usecase: multi-tenancy
- **Immutable**: cannot be renamed after provision
- **Finest acl grain**: Cluster Access Credential permissions can be granted down to the Scope level
scope: `_default` contains a `_default` collection

scope `_system` contains default collections

- collection `_mobile`
- collection `_query`

Indexes are defined under scope

### Bucket/Scope/Collection

- similar to table level
- **Immutable**: cannot be renamed after provision

#### Bucket/Scope/Collection/Document

- similar to document level
- > Individual file upload for documents can be up to 40MB

# Cross-Data Center Replication (XDCR)

> Use of cross-data center replication is not permitted by the Couchbase Community Edition license since Couchbase Server 7.0

- [Paid feature since June 30, 2021](https://www.couchbase.com/blog/couchbase-modifies-license-free-community-edition-package/)
