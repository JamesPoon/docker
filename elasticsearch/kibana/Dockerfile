FROM	node:8-alpine

ENV	LANG=C.UTF-8 \
#	JAVA_HOME=/usr/local/jvm/jre \
#	KB_HOME=/usr/local/kibana \
	PATH=${PATH}:/usr/local/kibana/bin

ADD	kibana-6.6.1-linux-x86_64 ${KB_HOME}

RUN	date \
#	&& apk update \
#	&& apk upgrade \
#	&& apk add bash openjdk8 \
#	&& ln -sf /usr/lib/jvm/java-1.8-openjdk /usr/local/jvm \
#	&& rm -rf /var/cache/apk/* \
#	&& addgroup kibana \
#	&& adduser -HD --g kibana kibana \
#	&& chown -R kibana:kibana ${KB_HOME} \
	&& date -R

#USER 	kibana
WORKDIR ${KB_HOME}

CMD ${KB_HOME}/bin/kibana

