#!/bin/bash

cd /usr/local/mysql
chown -R mysql:mysql /usr/local/mysql/logs/
chown -R mysql:mysql /usr/local/mysql/data/
mysqld --initialize-insecure --user=mysql
mysqld --user=mysql &
mysql
status;
create user repl@'%' identified by 'repl123465';
grant  replication slave on *.* to repl@'%';
flush privileges;
status;
exit;

