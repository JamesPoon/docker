FROM	panshx/alpine

ARG 	WEBPROC_VERSION=0.2.2 

ENV	WEBPROC_URL=https://github.com/jpillora/webproc/releases/download/${WEBPROC_VERSION}/webproc_linux_amd64.gz \
	WEBPROC_HOME=/usr/local/webproc \
	PATH=${PATH}:/usr/local/webproc/bin
	
ADD	conf/webproc.toml ${WEBPROC_HOME}/conf/webproc.toml

RUN 	date \
	&& apk update && apk upgrade \
	&& apk --no-cache add dnsmasq \
	&& apk add --no-cache --virtual .build-deps curl \
	&& mkdir -p ${WEBPROC_HOME}/bin \
	&& mkdir -p ${WEBPROC_HOME}/conf \
	&& mkdir -p ${WEBPROC_HOME}/logs \
	&& mkdir -p ${WEBPROC_HOME}/data \
#	&& touch ${WEBPROC_HOME}/conf/webproc.toml \
	&& curl -sL ${WEBPROC_URL} | gzip -d - > ${WEBPROC_HOME}/bin/webproc \
	&& chmod +x ${WEBPROC_HOME}/bin/webproc \
	&& apk del .build-deps \
	&& rm -rf /var/cache/apk/* \
	&& date -R

EXPOSE 53/tcp 53/udp 5380

WORKDIR	${WEBPROC_HOME}

#ENTRYPOINT ["webproc", "/usr/local/webproc/conf/webproc.toml"]

