#!/bin/bash

echo `pwd`

mysqld --user=mysql &

tail -f /dev/null
