
change by `CONFIG SET`

## Slow Log

`slowlog-log-slower-than`: time threshold to define slow

- default `10000` (10ms)
- `0` to include all logs
- `-1` or other less than 0: disable Slow Log
- practice `1000`

`slowlog-max-len`: max count of logs

- default `128`
- practice `1000` ~ `5000`
- adopt FIFO

## output buffer

`client-output-buffer-limit <class> <hard-limit> <soft-limit> <soft-seconds>`

- 超过soft-limit并持续soft-seconds后断开

class: `normal`

- 用于GET/SET
- default
  - `client-output-buffer-limit normal 0 0 0`
  - `0` means no limit (Disabled)
- 断开客户端
class: `pubsub`
- 用于 SUBSCRIBE / PSUBSCRIBE
- 断开客户端
- default
  - `client-output-buffer-limit pubsub 32mb 8mb 60`

class: `replica`

- 如果从节点同步太慢，主节点会断开复制连接，触发全量同步
- default
  - `client-output-buffer-limit replica 256mb 64mb 60`
