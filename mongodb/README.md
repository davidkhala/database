# Mongo DB
- MongoDB uses BSON to represent document structures.
- `_id_` is indexed by default
- MongoDB only creates the database when you first store data in that database. This data could be a collection or even a document.
- Setup to allow CORS, `mongod --bind_ip_all`
## Indexing
No auto indexing
- alternative: use Performance Advisor and **manually** apply recommendations.

## Queryable Encryption
Queryable Client-side field level encryption
- **Unique**: Not available in mongodb compatitle system
