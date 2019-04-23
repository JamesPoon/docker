FROM	panshx/glibc

ENV	LANG=C.UTF-8 \
	JAVA_HOME=/usr/local/jvm/jre \
	ES_HOME=/usr/local/elasticsearch \
	PATH=${PATH}:/usr/local/jvm/bin:/usr/local/jvm/jre/bin:/usr/local/elasticsearch/bin

ADD	elasticsearch-6.6.1 ${ES_HOME}

RUN	date \
	&& apk update \
	&& apk upgrade \
	&& apk add bash openjdk8 \
	&& ln -sf /usr/lib/jvm/java-1.8-openjdk /usr/local/jvm \
	&& rm -rf /var/cache/apk/* \
#	&& addgroup elasticsearch \
	&& adduser -HD -s /bin/bash -g elasticsearch elasticsearch \
	&& chown -R elasticsearch:elasticsearch ${ES_HOME} \
	&& date -R

USER 	elasticsearch
WORKDIR ${ES_HOME}

CMD ${ES_HOME}/bin/elasticsearch

