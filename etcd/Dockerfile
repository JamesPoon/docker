FROM	panshx/alpine

ARG 	ETCD_VERSION=v3.3.12 
ARG	DOWNLOAD_URL=https://github.com/etcd-io/etcd/releases/download

ENV	ETCD_HOME=/usr/local/etcd \
	PATH=${PATH}:/usr/local/etcd/bin
	
RUN 	date \
	&& mkdir -p ${ETCD_HOME}/bin \
	&& mkdir -p ${ETCD_HOME}/data \
	&& cd /tmp \
	&& wget ${DOWNLOAD_URL}/${ETCD_VERSION}/etcd-${ETCD_VERSION}-linux-amd64.tar.gz \
	&& tar -xzvf etcd-${ETCD_VERSION}-linux-amd64.tar.gz \
	&& mv etcd-${ETCD_VERSION}-linux-amd64/etcd* ${ETCD_HOME}/bin \
	&& rm -rf etcd-v2.0.10-linux-amd64* \
	&& rm -rf /var/cache/apk/* \
	&& date -R

EXPOSE	2379 2380

WORKDIR	${ETCD_HOME}

CMD	["etcd", "-data-dir=data"]

