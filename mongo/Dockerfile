FROM centos:7

ENV	MONGO_HOME=/usr/local/mongo \
	PATH=${PATH}:/usr/local/mongo/bin

RUN	date \
	&& yum makecache \
	&& yum install -y libcurl openssl \
	&& date -R 

WORKDIR	${MONGO_HOME}


