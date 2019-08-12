FROM	alpine:3.8

ENV	LANG=C.UTF-8 \
	SRC_HOME=/usr/local/openvpn/src \
	OPENVPN_HOME=/usr/local/openvpn \
	PATH=${PATH}:/usr/local/openvpn/bin
# 安装准备
RUN	apk update \
        && apk add --no-cache --virtual .build-deps curl \
	&& mkdir -p ${SRC_HOME} \
	&& cd ${SRC_HOME} \
        && curl -fSL https://swupdate.openvpn.org/community/releases/openvpn-install-2.4.7-I607-Win10.exe -o openvpn-install.exe


