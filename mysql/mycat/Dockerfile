FROM	panshx/jre-alpine

ENV	MYCAT_HOME=/usr/local/mycat

ADD	Mycat-server-1.6.5-release-20180122220033-linux.tar.gz /usr/local

RUN	date \
	&& date -R 

WORKDIR ${MYCAT_HOME}

CMD 	["bin/mycat", "console"]

