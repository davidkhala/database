## Best practice
- Use the outgoing direction when querying edges whenever it's possible
    - On the contrary, `in()` query will always be an expensive fan-out query.