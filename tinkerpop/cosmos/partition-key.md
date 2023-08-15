used to automatically distribute data across partitions for scalability. Choose a property in your JSON document that has a wide range of values and evenly distributes request volume
- Reserved keywords: `id` and `label` are not supported as partition keys
## Best practice
- Always specify the partition key value when querying a vertex: `g.V('vertex_id').has('partitionKey', 'partitionKey_value')`
