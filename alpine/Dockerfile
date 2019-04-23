FROM	alpine:3.8

ENV	LANG=C.UTF-8 \
	TZ=Asia/Shanghai

RUN	date \
	&& apk update \
	&& apk upgrade \
	&& apk add bash tzdata \
	&& cp -rf /usr/share/zoneinfo/${TZ} /etc/localtime \
	&& echo ${TZ} > /etc/timezone \
	&& rm -rf /var/cache/apk/* \
	&& rm -rf /root/.cache \
	&& rm -rf /tmp/* \
	&& date 
	