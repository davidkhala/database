Text Analyzer is used by both the index and during full text search

# Index

## Indexing Options??
- Simple
- Composite
- Array
- Functional
- Memory-Only or On-Disk
- top-level or sub-document
- Replica index


## Types
Primary Index: covers all document keys
- Perform a full Collection scan
- used by Developers for ad-hoc query, not for production
- `CREATE PRIMARY INDEX <index name> ON <collection>`
Secondary Index: created on selected fields

- Similar to typical SQL index
- if count(selected fields) > 1, aka. Composite Index
- `CREATE INDEX <index name> ON <collection> (field1, field2)`

Partial Index: cover subset of Documents

- aka. Filtered Index. By using `WHERE` clause in index definition
- `CREATE INDEX <index name> ON <collection> (field1, field2) WHERE ... `
- **Best practice**: saving system resources

# Search Indexes

vs Index??

Provision
>
- > Cluster needs 2 search nodes to support the requested replica count of 1
- ?Does it mean not available for free cluster?
