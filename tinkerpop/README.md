# [Apache TinkerPop](https://tinkerpop.apache.org/download.html)
A graph computing framework
- for both graph databases (OLTP) and graph analytic systems (OLAP).
- uses the Gremlin query language.
- Tinkerpop的实现并不是以“超大规模、复杂、大并发负载”为目的来思考设计的。 它是围绕着“单线程，OLTP类型的数据负载”这种常见类型来设计的，因为这样可以适配较多的图数据库类应用。
## [providers](https://tinkerpop.apache.org/providers.html)
Data System Providers
- CosmosDB
- Neo4j
- ArangoDB
- Amazon Neptune
- Hadoop (Spark)
- OrientDB
- TinkerGraph (gremlin-server)
- [hugegraph](https://github.com/apache/incubator-hugegraph)

## Sample data
- https://github.com/gephi/gephi/wiki/Datasets

## Refs
- https://medium.com/p/3dd563638bc2