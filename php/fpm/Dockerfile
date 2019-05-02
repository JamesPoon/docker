FROM	panshx/alpine

ENV 	NGINX_HOME=/usr/local/nginx \
	PHP_HOME=/usr/local/php \
	PATH=${PATH}:/usr/local/php/bin:/usr/local/php/sbin

RUN 	date \
	&& addgroup -S apache \
	&& adduser -HD -s /sbin/nologin -G apache apache \
	&& apk update \
	&& apk upgrade \
	&& apk add curl \
		php7 \
		php7-fpm \
		php7-common \
		php7-pcntl \
		php7-mysqli \
		php7-pdo_mysql \
		php7-mbstring \
		php7-json \
		php7-xml \
		php7-xmlrpc \
		php7-xsl \
		php7-zlib \
		php7-bz2 \
		php7-gd \
		php7-gettext \
		php7-intl \
		php7-yaml \
		php7-dom \
		php7-bcmath \
		php7-mcrypt \
		php7-imap \
		php7-phar \
		php7-curl \
		php7-iconv \
		php7-opcache \
		php7-ldap \
		php7-soap \
		php7-snmp \
		php7-memcached \
		php7-pear \
		php7-fileinfo \
		php7-sysvmsg \
		php7-soap \
		php7-apcu \
		php7-sockets \
		php7-ctype \
		php7-dom \
		php7-zip \
		php7-posix \
		php7-imap \
		php7-mailparse \
		php7-curl \
		php7-iconv \
		php7-ldap \
		php7-tokenizer \
		php7-openssl \
		php7-intl \
#	&& apk add --virtual .build-deps gcc libgcc make gnupg bison autoconf binutils libtool pcre linux-headers \
#	&& apk add --virtual .build-deps binutils-dev openssl-dev pcre-dev geoip-dev libpng-dev freetype-dev libmcrypt-dev gd-dev libxslt-dev musl-dev libc-dev jpeg-dev libxml2-dev zlib-dev \
#	&& ./configure \
#	--prefix=/usr/local/php \
#	--with-config-file-path=/usr/local/php/etc \
#	--with-fpm-user=apache \
#	--with-fpm-group=apache \
#	--enable-pdo \
#	--enable-mysqlnd \
#	--enable-fpm \
#	--enable-sysvsem \
#	--enable-sockets \
#	--enable-pcntl \
#	--enable-mbstring \
#	--enable-opcache \
#	--enable-shmop  \
#	--enable-zip \
#	--with-freetype-dir \
#	--with-mhash  \
#	--with-pdo-mysql \
#	--with-mcrypt  \
#	--with-zlib \
#	--with-pcre-dir \
#	--with-gd \
#	--with-curl=/usr/local/curl \
#	--with-openssl \
#	&& make && make install \
#	&& ln -s /usr/bin/php-fpm5 /usr/bin/php-fpm \
#	&& ln -s /usr/bin/php5 /usr/bin/php \
#	&& ln -s /usr/bin/phpize5 /usr/bin/phpize \
	&& curl -sSL https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer \
	&& curl -sSL http://pear.php.net/go-pear.phar | php -- --install-dir=${PHP_HOME}/bin --filename=pear \
	&& apk add --virtual .build-deps gcc g++ make autoconf binutils libtool pcre linux-headers openssl-dev php7-dev\
#	&& apk del gcc libgcc make bison autoconf binutils \
#	&& apk del linux-headers binutils-dev openssl-dev pcre-dev geoip-dev libpng-dev freetype-dev libmcrypt-dev gd-dev libxslt-dev musl-dev libc-dev jpeg-dev libxml2-dev zlib-dev \
	&& pecl install swoole \
	&& apk del .build-deps \
	&& apk del curl \
	&& rm -rf /var/cache/apk/* \
	&& rm -rf /tmp/* \
	&& date 

CMD	["/bin/sh"]
