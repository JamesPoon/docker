FROM 	panshx/jre

ENV 	KAFKA_HOME=/usr/local/kafka \
	SCALA_HOME=/usr/local/scala \
	PATH=${PATH}:/usr/local/scala/bin:/usr/local/kafka/bin

ADD	scala-2.11.12 ${SCALA_HOME}
ADD 	kafka_2.12-2.0.0 ${KAFKA_HOME}

RUN 	date \
	&& apk update \
	&& apk upgrade \
	&& apk add bash \
#        && yum install -y net-tools \
#        && yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel \
	&& date -R
	
EXPOSE 9092

WORKDIR ${KAFKA_HOME}

CMD ["bin/kafka-server-start.sh config/server.properties"]

