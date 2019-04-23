#!/bin/bash

/usr/sbin/sshd -D &

echo `pwd`

mysqld --user=mysql &

tail -f /dev/null
