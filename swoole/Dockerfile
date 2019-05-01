FROM	panshx/alpine

ARG	OPENSSL_VER=1.1.1b 
ARG	CURL_VER=7.64.1 
ARG	PHP_VER=7.3.4 
ARG	SWOOLE_VER=4.3.3 
ENV 	NGINX_HOME=/usr/local/nginx \
	PHP_HOME=/usr/local/php \
	LD_LIBRARY_PATH=/usr/local/openssl/lib:${LD_LIBRARY_PATH} \
	PATH=${PATH}:/usr/local/bin:/usr/local/curl/bin:/usr/local/openssl/bin:/usr/local/php/bin:/usr/local/php/sbin

RUN 	date \
	&& addgroup -S apache \
	&& adduser -HD -s /sbin/nologin -G apache apache \
	&& apk update \
	&& apk upgrade \
	&& apk add curl \
	&& mkdir -p /usr/local/src \
#	&& curl -sSL "https://www.php.net/distributions/php-${PHP_VER}.tar.gz" | tar -xvf - -C /usr/local/src \
	&& curl -sSL "https://www.php.net/distributions/php-${PHP_VER}.tar.gz" -o /tmp/php-${PHP_VER}.tar.gz \
	&& tar -xvf /tmp/php-${PHP_VER}.tar.gz -C /usr/local/src \
	&& curl -sSL "https://curl.haxx.se/download/curl-${CURL_VER}.tar.gz" -o /tmp/curl-${CURL_VER}.tar.gz \
	&& tar -xvf /tmp/curl-${CURL_VER}.tar.gz -C /usr/local/src \
	&& curl -sSL "https://www.openssl.org/source/openssl-${OPENSSL_VER}.tar.gz" -o /tmp/openssl-${OPENSSL_VER}.tar.gz \
	&& tar -xvf /tmp/openssl-${OPENSSL_VER}.tar.gz -C /usr/local/src \
	&& curl -sSL "http://pecl.php.net/get/swoole-${SWOOLE_VER}.tgz" -o /tmp/swoole-${SWOOLE_VER}.tgz \
	&& tar -xvf /tmp/swoole-${SWOOLE_VER}.tgz -C /usr/local/src \
	&& apk del curl \
	&& ls -al /usr/local/src \
#	&& date
#RUN	date \
#	&& apk add --virtual .build-deps gcc libgcc make gnupg bison autoconf binutils libtool pcre linux-headers \
#	&& apk add --virtual .build-deps binutils-dev openssl-dev pcre-dev geoip-dev libpng-dev freetype-dev libmcrypt-dev gd-dev libxslt-dev musl-dev libc-dev jpeg-dev libxml2-dev zlib-dev \
	&& apk add --no-cache --virtual .build-deps \
		autoconf  \
		gcc \
		g++ \
		make \
		gnupg \
		re2c \
		bison \
#		libcurl \
		dialog \
		libpq \
		libc-dev \
#		openssl-dev \
		libssh2-dev \
		pcre-dev \
		pcre2-dev \
		zlib-dev \
		linux-headers \
		libxslt-dev \
		libxpm-dev \
		gd-dev \
		geoip-dev \
		perl-dev \
		openssh-client \
		augeas-dev \
		ca-certificates \
		musl-dev \
		libmcrypt-dev \
		libpng-dev \
		libwebp-dev \
		icu-dev \
		libffi-dev \
		freetype-dev \
		gettext-dev \
		gmp-dev \
		curl-dev \
		bzip2-dev \
		libjpeg-turbo-dev \
		openldap-dev \
		sqlite-dev \
		libzip-dev \
		libidn-dev \
		net-snmp-dev \
#	&& date
#RUN	date \
	&& cd /usr/local/src/openssl-${OPENSSL_VER} \
	&& ls -al \
	&& ./config \
		--prefix=/usr/local/openssl \
		shared \
		zlib \
	&& make && make install \
#	&& date
#RUN	date \
	&& cd /usr/local/src/curl-${CURL_VER} \
	&& ./configure \
		--prefix=/usr/local/curl \
		--enable-http \
		--enable-ftp \
		--enable-file \
		--enable-ldap \
		--enable-ldaps \
		--enable-dict \
		--enable-proxy \
		--with-ssl \
	&& make && make install \
#	&& date
#RUN	date \
	&& cd /usr/local/src/php-${PHP_VER} \
#	&& ./configure \
#		--build=x86_64-alpine-linux-musl \
#		--host=x86_64-alpine-linux-musl \
#		--program-suffix=7 \
#		--prefix=/usr \
#		--libdir=/usr/lib/php7 \
#		--datadir=/usr/share/php7 \
#		--sysconfdir=/etc/php7 \
#		--localstatedir=/var \
#		--with-layout=GNU \
#		--with-pic \
#		--with-pear=/usr/share/php7 \
#		--with-config-file-path=/etc/php7 \
#		--with-config-file-scan-dir=/etc/php7/conf.d \
#		--disable-short-tags \
#		--enable-bcmath=shared \
#		--with-bz2=shared \
#		--enable-calendar=shared \
#		--enable-ctype=shared \
#		--with-curl=shared \
##		--enable-dba=shared \
##		--with-db4 \
##		--with-dbmaker=shared \
##		--with-gdbm \
#		--enable-dom=shared \
##		--with-enchant=shared \
#		--enable-exif=shared \
#		--enable-fileinfo=shared \
#		--enable-ftp=shared \
#		--with-gd=shared \
#		--with-freetype-dir=/usr \
#		--disable-gd-jis-conv \
#		--with-jpeg-dir=/usr \
#		--with-png-dir=/usr \
#		--with-webp-dir=/usr \
#		--with-xpm-dir=/usr \
#		--with-gettext=shared \
#		--with-gmp=shared \
#		--with-iconv=shared \
##		--with-imap=shared \
##		--with-imap-ssl \
#		--with-icu-dir=/usr \
##		--enable-intl=shared \
#		--enable-json=shared \
#		--with-kerberos \
#		--with-ldap=shared \
#		--with-ldap-sasl \
#		--with-libedit \
#		--enable-libxml \
#		--with-libxml-dir=/usr \
#		--enable-mbstring=shared \
#		--with-mysqli=shared,mysqlnd \
##		--with-mysql-sock=/run/mysqld/mysqld.sock \
#		--enable-mysqlnd=shared \
#		--enable-opcache=shared \
#		--with-openssl=shared \
#		--with-system-ciphers \
#		--enable-pcntl=shared \
#		--with-pcre-regex=/usr \
#		--enable-pdo=shared \
##		--with-pdo-dblib=shared \
#		--with-pdo-mysql=shared,mysqlnd \
##		--with-pdo-odbc=shared,unixODBC,/usr \
##		--with-pdo-pgsql=shared \
#		--with-pdo-sqlite=shared,/usr \
##		--with-pgsql=shared \
#		--enable-phar=shared \
#		--enable-posix=shared \
##		--with-pspell=shared \
#		--without-readline \
##		--with-recode=shared \
#		--enable-session=shared \
#		--enable-shmop=shared \
#		--enable-simplexml=shared \
#		--with-snmp=shared \
#		--enable-soap=shared \
##		--with-sodium=shared \
#		--enable-sockets=shared \
##		--with-sqlite3=shared,/usr \
#		--enable-sysvmsg=shared \
#		--enable-sysvsem=shared \
#		--enable-sysvshm=shared \
##		--with-tidy=shared \
#		--enable-tokenizer=shared \
##		--with-unixODBC=shared,/usr \
#		--enable-wddx=shared \
#		--enable-xml=shared \
#		--enable-xmlreader=shared \
#		--with-xmlrpc=shared \
#		--enable-xmlwriter=shared \
#		--with-xsl=shared \
#		--with-sqlite=shared \
#		--enable-zip=shared \
#		--with-libzip=/usr \
#		--with-zlib \
#		--with-zlib-dir=/usr \
#		--disable-phpdbg \
#		--enable-fpm \
#		--enable-embed \
##		--with-litespeed \
#		build_alias=x86_64-alpine-linux-musl \
#		host_alias=x86_64-alpine-linux-musl \
	&& ./configure \
	--prefix=${PHP_HOME} \
	--with-config-file-path=${PHP_HOME}/etc \
		--with-config-file-scan-dir=${PHP_HOME}/etc/conf.d \
		--libdir=${PHP_HOME}/lib \
		--datadir=${PHP_HOME}/share \
		--sysconfdir=${PHP_HOME}/etc \
		--localstatedir=${PHP_HOME}/var \
	--with-fpm-user=apache \
	--with-fpm-group=apache \
	--enable-fpm \
		--enable-embed \
	--enable-pdo \
	--enable-mysqlnd \
	--enable-sysvsem \
		--enable-sysvmsg \
		--enable-sysvshm \
	--enable-sockets \
	--enable-pcntl \
	--enable-mbstring \
	--enable-opcache \
#	--enable-shmop  \
	--enable-zip \
		--enable-phar \
		--enable-posix \
		--enable-soap \
		--enable-tokenizer \
		--enable-phar \
		--enable-posix \
		--enable-bcmath \
		--with-bz2 \
		--enable-calendar \
		--enable-ctype \
		--enable-libxml \
		--enable-json \
		--enable-exif \
		--enable-fileinfo \
		--enable-ftp \
	--with-freetype-dir \
	--with-mhash  \
	--with-pdo-mysql \
	--with-zlib \
	--with-pcre-dir \
	--with-gd \
	--with-curl=/usr/local/curl \
	--with-openssl \
	&& make && make install \
	&& cp php.ini-production ${PHP_HOME}/etc/php.ini \
	&& cp php.ini-production ${PHP_HOME}/etc/php.ini-production \
	&& cp php.ini-development  ${PHP_HOME}/etc/php.ini-development \
	&& cp ${PHP_HOME}/etc/php-fpm.conf.default ${PHP_HOME}/etc/php-fpm.conf \
	&& cp ${PHP_HOME}/etc/php-fpm.d/www.conf.default ${PHP_HOME}/etc/php-fpm.d/www.conf \
#	&& date
#RUN	date \
#	&& ln -s /usr/bin/php-fpm7 /usr/bin/php-fpm \
#	&& ln -s /usr/bin/php7 /usr/bin/php \
#	&& ln -s /usr/bin/phpize7 /usr/bin/phpize \
#	&& ln -s /usr/bin/php-fpm5 /usr/bin/php-fpm \
#	&& ln -s /usr/bin/php5 /usr/bin/php \
#	&& ln -s /usr/bin/phpize5 /usr/bin/phpize \
	&& curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer \
	&& curl -s http://pear.php.net/go-pear.phar | php -- --install-dir=${PHP_HOME}/bin --filename=pear \
#	&& apk add --virtual .build-deps gcc libgcc make gnupg bison autoconf binutils libtool pcre linux-headers \
#	&& apk del gcc libgcc make bison autoconf binutils \
#	&& apk del linux-headers binutils-dev openssl-dev pcre-dev geoip-dev libpng-dev freetype-dev libmcrypt-dev gd-dev libxslt-dev musl-dev libc-dev jpeg-dev libxml2-dev zlib-dev \
#	&& date
#RUN	date \
	&& cd /usr/local/src/swoole-${SWOOLE_VER} \
	&& phpize \
	&& ./configure \
		 --with-php-config=${PHP_HOME}/bin/php-config \
		--enable-openssl \
		--enable-sockets \
		--enable-http2 \
#		--with-openssl-dir=/usr/local/openssl \
	&& make && make install \
	&& mkdir -p ${PHP_HOME}/etc/conf.d \
	&& echo 'extension=swoole.so' > ${PHP_HOME}/etc/conf.d/swoole.ini \
	&& echo 'zend_extension=opcache.so' > ${PHP_HOME}/etc/conf.d/opcache.ini \
	&& apk add libstdc++ \
#	&& date
#RUN	date \
#	&& apk del .build-deps \
	&& ldd ${PHP_HOME}/bin/php \
	&& ls -al ${PHP_HOME}/lib/**.so \
	&& apk add --no-cache --virtual .gettext gettext \
	&& mv /usr/bin/envsubst /tmp/ \
	&& rundeps="$( \
		scanelf --needed --nobanner \
		/usr/local/openssl/bin/openssl /usr/local/openssl/lib/*.so /usr/local/openssl/lib/extensions/no-debug-non-zts-20180731/*.so\
		/usr/local/curl/bin/curl /usr/local/curl/lib/*.so \
		/usr/local/php/bin/php /usr/local/php/bin/php-cgi /usr/local/php/lib/*.so \
		/tmp/envsubst \
		| awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
		| sort -u \
		| xargs -r apk info --installed \
		| sort -u \
	)" \
    	&& apk add --no-cache --virtual .rundeps ${rundeps} \
    	&& apk del .build-deps \
    	&& apk del .gettext \
#	&& date
#RUN	date \
	&& rm -rf /tmp/*.tar.gz /tmp/*.tgz \ 
	&& rm -rf /usr/local/src \ 
	&& rm -rf /var/cache/apk/* \
	&& date 
	
WORKDIR	${PHP_HOME}

CMD	["/bin/sh"]
