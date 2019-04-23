FROM	centos:7 

ENV	MSQQL_HOME=/usr/local/mssql \
	PATH=${PATH}:/usr/local/mssql/bin

ADD	mssql-server.repo /etc/yum.repos.d/

RUN	date \
	&& mkdir -p /usr/local \
	&& ln -s /opt/mssql ${MSQQL_HOME} \
	&& yum install -y mssql-server \
	&& yum clean all \
	&& date -R 

WORKDIR	${MSQQL_HOME}

CMD	["bin/sqlservr"]
