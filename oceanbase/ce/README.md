# Oceanbase Community Edition

## Install

as Docker container

```
docker run -p 2881:2881 --name oceanbase-ce -e MODE=mini -d oceanbase/oceanbase-ce
```

- **Exclusive**: it is not designed for k8s.
  - You need to go for [`ob-operator`](https://github.com/oceanbase/ob-operator) seperately
- volumes
  - `/root/ob` for data volume
  - `/root/.obd/cluster` for configuration
- Environments
  - `mode`: `slim` | `normal` (default)