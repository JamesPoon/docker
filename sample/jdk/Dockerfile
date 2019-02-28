FROM alpine:3.8

RUN \
  apk update && \
  apk upgrade && \
  apk add openjdk8 && \
  ln -sf /usr/lib/jvm/java-1.8-openjdk /usr/lib/jvm/default && \
  rm -rf /var/cache/apk/*

ENV JAVA_HOME=/usr/lib/jvm/default \
    PATH=${PATH}:/usr/lib/jvm/default/jre/bin:/usr/lib/jvm/default/bin

CMD ["java", "-version"]

