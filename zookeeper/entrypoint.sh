#!/bin/bash

/usr/local/zookeeper/bin/zkServer.sh start

exec /usr/sbin/sshd -D -e 

#exec "$@"

