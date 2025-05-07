# [SQL++](https://www.couchbase.com/products/n1ql/)
>
> ANSI SQL for JSON

- aka. N1QL
- ANSI SQL 2003 compliant

# Syntax
String
- When Collection name or any fields have special characters, enclose it by backtick (`)
- bucket name and attribute desc are case sensitive
- query keywords(e.g. `select`, `from`, `Where`) are not case sensitive

Specials 
- To get a document's metadata. `SELECT meta() FROM <collection>`


```Insert
INSERT INTO <collection> (KEY,VALUE)
VALUES ("<key|id>", {
    ...
})
```

```Update
Update <collection>
USE KEYS "<filtering key value>"
SET <key> = "<new value>"
```

```Select
SELECT tracks[0] FROM playlist
```

- `USE KEYS` allows user to get Document by ID without using index.

```UPSERT
UPSERT INTO <collection>
VALUES ("<key>"::"<filtering key value>", {
    ...
})
```

Multi-document ACID transactions

```
BEGIN Transaction;
...
COMMIT;

```

## joins
Join by Document Key
- You need to add alias for both sides and use the `ON KEYS` clause
  - `SELECT * FROM playlist p JOIN user u ON KEYS "userprofile::"||p.owner.username WHERE p.owner.username ="David"`
- Join with Array of references to Document Keys
  - `SELECT * FROM playlist p JOIN track t ON KEYS ARRAY "track::"||trackId FOR trackId IN p.tracks END`



# Feature



Cost-based optimizer(CBO)

Global Secondary Indexes (GSI)

Multi-dimensional scaling (MDS)

Full-text search (FTS)
