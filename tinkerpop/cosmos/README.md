https://learn.microsoft.com/en-us/azure/cosmos-db/gremlin/introduction

- Vertices require a partition key
- You can find your partition key of sample app by 
    1. Select `Data Explorer(数据资源管理器)`
    2. Expand `Data`, Expand targeted database, Expand targeted graph, Select `Graph`
    3. At the tool bar, click [New Vertex]
    4. The right side bar (fade in) will mandates the input of the value of partition key. So you get the partition key string here.

## Quick start
1. Select `Data Explorer(数据资源管理器)` > Connect
2. Click button [Download sample app]
    - **Gremlin Console**: It will create database `graphdb` with graph `Persons`
    - **Guided Gremlin Tour**: Similar to **Gremlin Console**



## Setup


Add a graph
- Select `Data Explorer(数据资源管理器)` > [New Graph].
- Specify:
    - Database id: A database is analogous to a namespace. It is a unit of management for a set of graphs
        - If your are in context of existing database, it can be skipped
    - Graph id: Unique identifier for the graph and used for id-based routing through REST and all SDKs
    - [Partition key](./partition-key.md)



## Compatibility
- [Some features supported by Apache TinkerPop are not available in Azure Cosmos DB.](https://learn.microsoft.com/en-us/azure/cosmos-db/gremlin/support)
