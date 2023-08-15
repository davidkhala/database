# Install
By podman
- podman pull tinkerpop/gremlin-server
- podman run -it tinkerpop/gremlin-console bash

## Sample App
### "Modern" Graph
![img](https://tinkerpop.apache.org/docs/current/images/tinkerpop-modern.png)

In **gremlin-console**, run
```
graph = TinkerFactory.createModern();
```

### Connect
Connect to any Graph in **gremlin-console**
```
...(define graph)
g = traversal().withEmbedded(graph)
```

