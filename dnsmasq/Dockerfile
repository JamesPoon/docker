FROM	panshx/alpine

ENV	DNSMASQ_HOME=/usr/local/dnsmasq
RUN 	date \
	&& mkdir -p ${DNSMASQ_HOME} \
	&& apk update && apk upgrade \
	&& apk --no-cache add dnsmasq \
	&& rm -rf /var/cache/apk/* \
	&& date -R

EXPOSE 53/tcp 53/udp

WORKDIR	${DNSMASQ_HOME}

#ENTRYPOINT ["dnsmasq", "-k"]
CMD	["dnsmasq", "-k"]

