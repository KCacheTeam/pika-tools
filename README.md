# pika-port
---
*This project is used to move data from pika to pika/redis.*


## Intro
---

Pika-port 把自已伪装成 pika 的 slave, 通过 trysync 先把数据全量同步给 pika/redis，然后再进行增量通过。

大致流程：

>- 1 发送 trysync 全量同步命令 -> 接收 dump 数据 -> 解析 dump 数据 -> 过滤 -> 发送给 pika/redis；
>- 2 发送 trysync 增量同步命令 -> 接收 binlog -> 解析 binlog 数据 -> 过滤 -> 发送给 pika/redis；

## Compilation
---

sh build.sh