## Configure

### efm.properties
`./efm.sh configure-cluster <DB password>`

- location:`/etc/edb/efm-*/efm.properties`
- EFM installer will automatically creates a file template for the properties file named `efm.properties.in` in the `/etc/edb/efm-*` directory.
- EFM requires you to encrypt your database password before including it in the cluster properties file
    - `./efm.sh passwd-swap`
- You must restart Failover Manager to apply the changes.


### efm.nodes
