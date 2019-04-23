FROM	panshx/alpine

ARG	NGINX_VERSION=1.15.9
ARG	NGINX_DIR=/usr/local/nginx
ARG	NGINX_CONFIG="\
		--prefix=${NGINX_DIR} \
		--sbin-path=sbin/nginx \
		--modules-path=sbin/modules \
		--conf-path=conf/nginx.conf \
		--error-log-path=logs/error.log \
		--http-log-path=logs/access.log \
		--pid-path=logs/nginx.pid \
		--lock-path=logs/nginx.lock \
		--http-client-body-temp-path=temp/client \
		--http-proxy-temp-path=temp/proxy \
		--http-fastcgi-temp-path=temp/fastcgi \
		--http-uwsgi-temp-path=temp/uwsgi \
		--http-scgi-temp-path=temp/scgi \
		--user=nginx \
		--group=nginx \
		--with-http_ssl_module \
		--with-http_realip_module \
		--with-http_addition_module \
		--with-http_sub_module \
		--with-http_dav_module \
		--with-http_flv_module \
		--with-http_mp4_module \
		--with-http_gunzip_module \
		--with-http_gzip_static_module \
		--with-http_random_index_module \
		--with-http_secure_link_module \
		--with-http_stub_status_module \
		--with-http_auth_request_module \
		--with-http_xslt_module=dynamic \
		--with-http_image_filter_module=dynamic \
		--with-http_geoip_module=dynamic \
		--with-threads \
		--with-stream \
		--with-stream_ssl_module \
		--with-stream_ssl_preread_module \
		--with-stream_realip_module \
		--with-stream_geoip_module=dynamic \
		--with-http_slice_module \
		--with-mail \
		--with-mail_ssl_module \
		--with-compat \
		--with-file-aio \
		--with-http_v2_module \
	"

ENV 	NGINX_HOME=/usr/local/nginx \
	PATH=${PATH}:/usr/local/nginx/sbin

ADD	./nginx-${NGINX_VERSION} /usr/local/src/nginx
ADD	./conf/nginx.conf ${NGINX_HOME}/conf/nginx.conf
ADD	./conf/conf.d/default.conf ${NGINX_HOME}/conf/conf.d/default.conf

WORKDIR	${NGINX_HOME}

RUN 	date \
	&& addgroup -S nginx \
	&& adduser -D -S -h /var/cache/nginx -s /sbin/nologin -G nginx nginx \
	&& mkdir -p ${NGINX_HOME}/logs \
	&& cd ${NGINX_HOME} \
	&& mkdir -p logs conf data temp \
	&& cd ${NGINX_HOME}/temp \
	&& mkdir -p client fastcgi proxy uwsgi scgi \
	&& apk update \
	&& apk upgrade \
	&& apk add --no-cache --virtual .build-deps \
		gcc \
		libc-dev \
		make \
		openssl-dev \
		pcre-dev \
		zlib-dev \
		linux-headers \
		curl \
		gnupg1 \
		libxslt-dev \
		gd-dev \
		geoip-dev \
#	&& apk add nginx \
#	&& apk add php5 php5-fpm php5-zip php5-xmlrpc php5-mysql php5-common php5-soap php5-bz2 php5-pdo_mysql php5-mcrypt php5-gd php5-xml php5-pear php5-phar php5-apcu php5-pdo php5-dom php5-curl php5-xsl php5-ldap php5-json php5-bcmath php5-opcache \
#	&& apk add curl \
#	&& apk del curl \
#	&& apk add --virtual .build-deps gcc libgcc make gnupg bison autoconf binutils libtool pcre linux-headers \
#	&& apk add --virtual .build-deps binutils-dev openssl-dev pcre-dev geoip-dev libpng-dev freetype-dev libmcrypt-dev gd-dev libxslt-dev musl-dev libc-dev jpeg-dev libxml2-dev zlib-dev \
#	&& apk --update --no-cache add geoip geoip-dev pcre libxslt gd openssl-dev pcre-dev zlib-dev build-base linux-headers libxslt-dev gd-dev openssl-dev libstdc++ libgcc patch logrotate supervisor inotify-tools \
#	&& apk --update --no-cache --virtual .build-deps add build-base linux-headers libstdc++ libgcc geoip-dev openssl-dev pcre-dev zlib-dev libxslt-dev gd-dev openssl-dev \
#	&& apk --update --no-cache add  patch logrotate supervisor inotify-tools \
	&& cd /usr/local/src/nginx \
	&& ./configure ${NGINX_CONFIG} \
#	&& ./configure \
#	--prefix=/usr/local/nginx \
##	--sbin-path=sbin/nginx \
##	--conf-path=conf/nginx.conf \
#	--user=nginx \
#	--group=nginx \
##	--error-log-path=logs/error.log \
##	--http-log-path=logs/access.log \
##	--pid-path=logs/nginx.pid \
##	--lock-path=logs/nginx.lock \
#	--with-http_ssl_module \
#	--with-http_stub_status_module \
#	--with-http_gzip_static_module \
#	--with-http_flv_module \
#	--with-http_mp4_module  \
#	--http-client-body-temp-path=temp/client \
#	--http-proxy-temp-path=temp/proxy \
#	--http-fastcgi-temp-path=temp/fastcgi  \
#	--http-uwsgi-temp-path=temp/uwsgi \
#	--http-scgi-temp-path=temp/scgi \
	&& make && make install \
	&& install -m644 html/index.html ${NGINX_HOME}/html/ \
	&& install -m644 html/50x.html ${NGINX_HOME}/html/ \
	&& ls -al ${NGINX_HOME}/sbin \
	&& ls -al ${NGINX_HOME}/sbin/modules \
	&& strip ${NGINX_HOME}/sbin/nginx* \
	&& strip ${NGINX_HOME}/sbin/modules/*.so \
#	&& apk del gcc libgcc make bison autoconf binutils build-base linux-headers libstdc++ libgcc \
#	&& apk del .build-deps \
#	&& addgroup -S nginx \
#	&& adduser -HD -s /sbin/nologin -G nginx nginx \
##########resolve dependences#############################
	&& apk add --no-cache --virtual .gettext gettext \
	&& mv /usr/bin/envsubst /tmp/ \
	&& runDeps="$( \
		scanelf --needed --nobanner --format '%n#p' ${NGINX_HOME}/sbin/nginx ${NGINX_HOME}/sbin/modules/*.so /tmp/envsubst \
			| tr ',' '\n' \
			| sort -u \
			| awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
	)" \
	&& apk add --no-cache --virtual .nginx-rundeps $runDeps \
	&& apk del .build-deps \
	&& apk del .gettext \
	&& mv /tmp/envsubst /usr/local/bin/ \
	&& rm -rf /var/cache/apk/* \
	&& rm -rf /usr/local/src \
	&& date 

CMD	["nginx", "-g", "daemon off;"]
