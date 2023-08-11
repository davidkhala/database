https://learn.microsoft.com/en-us/azure/cosmos-db/gremlin/introduction

## quick start
1. Select `Data Explorer(数据资源管理器)` > Connect
2. Click button [Download sample app]
    - Gremlin Console
        - It will create database `graphdb` with graph `Persons`
    - Guided Gremlin Tour


## Setup


Add a graph
- Select `Data Explorer(数据资源管理器)` > New Graph.
- Specify:
    - Database id: A database is analogous to a namespace. It is a unit of management for a set of graphs
    - Graph id: Unique identifier for the graph and used for id-based routing through REST and all SDKs
    - Partition key: used to automatically distribute data across partitions for scalability. Choose a property in your JSON document that has a wide range of values and evenly distributes request volume



## Compatibility
[Some features supported by Apache TinkerPop are not available in Azure Cosmos DB.](https://learn.microsoft.com/en-us/azure/cosmos-db/gremlin/support)

