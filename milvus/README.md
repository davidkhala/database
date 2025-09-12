# Milvus
a vector store
- [open source](https://github.com/milvus-io/milvus)
- Part of [LF_AI & DATA]


## Milvus Lite
no windows support


## Milvus Standalone (RPM/DEB Package)
requirement
- libstdc++ 8.5.0

## Milvus Image
[single docker](https://milvus.io/docs/install_standalone-docker.md#Install-Milvus-in-Docker)
- [`standalone_embed.sh`](https://raw.githubusercontent.com/milvus-io/milvus/master/scripts/standalone_embed.sh): the lifecycle manager with command groups:
  - `start` | `restart` | `stop`
  - `version` | `upgrade`
  - `delete`: after stop, delete Milvus data


# [Zilliz Cloud](https://cloud.zilliz.com/)
the managed Milvus