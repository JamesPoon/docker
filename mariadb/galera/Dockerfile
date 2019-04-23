FROM	panshx/centos

ENV	MARIADB_HOME=/usr/local/mariadb

ADD	./mariadb.repo /etc/yum.repos.d/mariadb.repo

RUN	date \
	&& yum makecache \
	&& yum install -y boost-program-options \
	&& yum install -y MariaDB-server MariaDB-client \
	&& yum install -y galera \
	&& yum clean all \
	&& date -R
	
WORKDIR	${MARIADB_HOME}

