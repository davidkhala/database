# Mongo DB
- MongoDB uses [BSON](https://bsonspec.org/) to store document.
- `_id_` is indexed by default
- MongoDB only creates the database when you first store data in that database. This data could be a collection or even a document.
  - >created when needed, not when selected
- Setup to allow CORS, `mongod --bind_ip_all`
- internal databases `admin` and `local` should be prevented from Applications
  - `local`: host the oplog. See in https://www.mongodb.com/docs/manual/reference/local-database/#the-local-database
  - `admin`: host users
## Indexing
No auto indexing
- alternative: use Performance Advisor and **manually** apply recommendations.

## Queryable Encryption
Queryable Client-side field level encryption
- **Unique**: Not available in mongodb compatitle system
