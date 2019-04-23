#FROM	php:5.6-fpm-alpine
FROM	panshx/alpine

ENV 	NGINX_HOME=/usr/local/nginx \
	PHP_HOME=/usr/local/php \
	PATH=${PATH}:/usr/local/nginx/sbin:/usr/local/curl/bin:/usr/local/php/bin:/usr/local/php/sbin

ADD	./curl-7.64.0 /usr/local/src/curl
ADD	./php-5.6.40 /usr/local/src/php

VOLUME	["/usr/local/nginx", "/usr/local/nginx/logs", "/usr/local/nginx/conf"]

WORKDIR	${NGINX_HOME}

RUN 	date \
	&& mkdir -p ${NGINX_HOME}/logs \
	&& apk update \
	&& apk upgrade \
	&& apk add nginx \
#	&& apk add php5 php5-fpm php5-zip php5-xmlrpc php5-mysql php5-common php5-soap php5-bz2 php5-pdo_mysql php5-mcrypt php5-gd php5-xml php5-pear php5-phar php5-apcu php5-pdo php5-dom php5-curl php5-xsl php5-ldap php5-json php5-bcmath php5-opcache \
#	&& apk add curl \
	&& apk del curl \
	&& apk add --virtual .build-deps gcc libgcc make gnupg bison autoconf binutils libtool pcre linux-headers \
	&& apk add --virtual .build-deps binutils-dev openssl-dev pcre-dev geoip-dev libpng-dev freetype-dev libmcrypt-dev gd-dev libxslt-dev musl-dev libc-dev jpeg-dev libxml2-dev zlib-dev \
	&& cd /usr/local/src/curl \
	&& ./configure --prefix=/usr/local/curl/ --without-nss --with-ssl --enable-manual \
	&& make && make install \
	&& cd /usr/local/src/php \
	&& ./configure \
	--prefix=/usr/local/php \
	--with-config-file-path=/usr/local/php/etc \
	--with-fpm-user=apache \
	--with-fpm-group=apache \
	--enable-pdo \
	--enable-mysqlnd \
	--enable-fpm \
	--enable-sysvsem \
	--enable-sockets \
	--enable-pcntl \
	--enable-mbstring \
	--enable-opcache \
	--enable-shmop  \
	--enable-zip \
	--with-freetype-dir \
	--with-mhash  \
	--with-pdo-mysql \
	--with-mcrypt  \
	--with-zlib \
	--with-pcre-dir \
	--with-gd \
	--with-curl=/usr/local/curl \
	--with-openssl \
	&& make && make install \
#	&& ln -s /usr/bin/php-fpm5 /usr/bin/php-fpm \
#	&& ln -s /usr/bin/php5 /usr/bin/php \
#	&& ln -s /usr/bin/phpize5 /usr/bin/phpize \
	&& curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer \
	&& curl -s http://pear.php.net/go-pear.phar | php -- --install-dir=${PHP_HOME}/bin --filename=pear \
#	&& apk add --virtual .build-deps gcc libgcc make gnupg bison autoconf binutils libtool pcre linux-headers \
	&& apk del gcc libgcc make bison autoconf binutils \
#	&& apk del linux-headers binutils-dev openssl-dev pcre-dev geoip-dev libpng-dev freetype-dev libmcrypt-dev gd-dev libxslt-dev musl-dev libc-dev jpeg-dev libxml2-dev zlib-dev \
	&& rm -rf /var/cache/apk/* \
	&& rm -rf /usr/local/src \
	&& addgroup -S apache \
	&& adduser -HD -s /sbin/nologin -G apache apache \
	&& date 

CMD	["/bin/sh"]
