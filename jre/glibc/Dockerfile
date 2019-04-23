FROM	panshx/glibc

# Java Version and other ENV
ENV 	JAVA_VERSION_MAJOR=8 \
    	JAVA_VERSION_MINOR=201 \
    	JAVA_VERSION_BUILD=09 \
    	JAVA_PACKAGE=server-jre \
    	JVM_HOME=/usr/local/jvm \
    	JAVA_HOME=/usr/local/jvm/jre \
    	PATH=${PATH}:/usr/local/jvm/jre/bin:/usr/local/jvm/bin 

RUN 	set -ex && \
    	apk -U upgrade && \ 
    	apk add libstdc++ curl ca-certificates bash java-cacerts && \
    	echo "Installing jdk" && \
    	curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie" -o /tmp/java.tar.gz \
      	http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/42970487e3af4f5aa5bca3f542482c60/${JAVA_PACKAGE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz && \
    	JAVA_PACKAGE_SHA256=$(curl -sSL https://www.oracle.com/webfolder/s/digest/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}checksum.html | grep -E "${JAVA_PACKAGE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64\.tar\.gz" | grep -Eo '(sha256: )[^<]+' | cut -d: -f2 | xargs) && \
    	echo "${JAVA_PACKAGE_SHA256}  /tmp/java.tar.gz" > /tmp/java.tar.gz.sha256 && \
    	sha256sum -c /tmp/java.tar.gz.sha256 && \
    	tar -C /tmp -zxf /tmp/java.tar.gz && \
    	mkdir -p /usr/local && \
#    	mv /tmp/jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR} ${JVM_HOME} && \
#    	ln -s ${JVM_HOME}/jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR} ${JVM_HOME} && \
	mv /tmp/jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR} ${JVM_HOME} && \
    	find ${JVM_HOME}/ -maxdepth 1 -mindepth 1 | grep -v jre | grep -v bin | xargs rm -rf && \
#    	ln -s ${JVM_HOME}/jre/bin ${JVM_HOME}/bin && \
    	echo "Installing Unlimited JCE policy" && \
      	curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie" -o /tmp/jce_policy-${JAVA_VERSION_MAJOR}.zip \
        http://download.oracle.com/otn-pub/java/jce/${JAVA_VERSION_MAJOR}/jce_policy-${JAVA_VERSION_MAJOR}.zip && \
      	cd /tmp && unzip /tmp/jce_policy-${JAVA_VERSION_MAJOR}.zip && \
      	cp -v /tmp/UnlimitedJCEPolicyJDK8/*.jar ${JVM_HOME}/jre/lib/security/ && \
    	sed -i s/#networkaddress.cache.ttl=-1/networkaddress.cache.ttl=10/ ${JVM_HOME}/jre/lib/security/java.security && \
    	ln -sf /etc/ssl/certs/java/cacerts ${JVM_HOME}/jre/lib/security/cacerts && \
    	apk del curl && \
    	rm -rf ${JVM_HOME}/jre/plugin \
           ${JVM_HOME}/jre/bin/javaws \
           ${JVM_HOME}/jre/bin/orbd \
           ${JVM_HOME}/jre/bin/pack200 \
           ${JVM_HOME}/jre/bin/policytool \
           ${JVM_HOME}/jre/bin/rmid \
           ${JVM_HOME}/jre/bin/rmiregistry \
           ${JVM_HOME}/jre/bin/servertool \
           ${JVM_HOME}/jre/bin/tnameserv \
           ${JVM_HOME}/jre/bin/unpack200 \
           ${JVM_HOME}/jre/lib/javaws.jar \
           ${JVM_HOME}/jre/lib/deploy* \
           ${JVM_HOME}/jre/lib/desktop \
           ${JVM_HOME}/jre/lib/*javafx* \
           ${JVM_HOME}/jre/lib/*jfx* \
           ${JVM_HOME}/jre/lib/amd64/libdecora_sse.so \
           ${JVM_HOME}/jre/lib/amd64/libprism_*.so \
           ${JVM_HOME}/jre/lib/amd64/libfxplugins.so \
           ${JVM_HOME}/jre/lib/amd64/libglass.so \
           ${JVM_HOME}/jre/lib/amd64/libgstreamer-lite.so \
           ${JVM_HOME}/jre/lib/amd64/libjavafx*.so \
           ${JVM_HOME}/jre/lib/amd64/libjfx*.so \
           ${JVM_HOME}/jre/lib/ext/jfxrt.jar \
           ${JVM_HOME}/jre/lib/oblique-fonts \
           ${JVM_HOME}/jre/lib/plugin.jar \
           /tmp/* \
           /var/cache/apk/* 

CMD ["java", "-version"]

