## Syntax
- The TinkerPop model does not allow for multiple labels as Neo4j does

## Best practice
- Use the outgoing direction when querying edges whenever it's possible
    - On the contrary, `in()` query will always be an expensive fan-out query.