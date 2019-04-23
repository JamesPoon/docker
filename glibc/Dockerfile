FROM	alpine:3.8

ENV 	LANG=C.UTF-8 \
    	GLIBC_VERSION=2.29-r0 \
    	GLIBC_REPO=https://github.com/sgerrand/alpine-pkg-glibc

# Download and install glibc
RUN 	set -ex && \
    	apk -U upgrade && \
    	apk add libstdc++ curl ca-certificates bash java-cacerts && \
    	for pkg in glibc-${GLIBC_VERSION} glibc-bin-${GLIBC_VERSION} glibc-i18n-${GLIBC_VERSION}; do \
        	curl -sSL ${GLIBC_REPO}/releases/download/${GLIBC_VERSION}/${pkg}.apk -o /tmp/${pkg}.apk; \ 
    	done && \
    	apk add --allow-untrusted /tmp/*.apk && \
    	( /usr/glibc-compat/bin/localedef --force --inputfile POSIX --charmap UTF-8 C.UTF-8 || true ) && \
    	echo "export LANG=C.UTF-8" > /etc/profile.d/locale.sh && \
    	/usr/glibc-compat/sbin/ldconfig /lib /usr/glibc-compat/lib && \
    	echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf && \
    	apk del curl glibc-i18n && \
    	rm -v /tmp/*.apk && \
    	echo "installed glibc"

