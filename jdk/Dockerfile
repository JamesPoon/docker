FROM alpine:3.8

RUN \
  apk update && \
  apk upgrade && \
  apk add openjdk8 && \
  mkdir -p /usr/local && \
  ln -sf /usr/lib/jvm/java-1.8-openjdk /usr/local/jvm && \
  rm -rf /var/cache/apk/*

ENV JAVA_HOME=/usr/local/jvm/jre \
    PATH=${PATH}:/usr/local/jvm/jre/bin:/usr/local/jvm/bin

CMD ["java", "-version"]

