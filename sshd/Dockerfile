FROM        alpine:3.8

# install sshd

RUN mkdir -p /root/.ssh && chmod 700 /root/.ssh \
&& apk update && apk upgrade && apk add openssh \
&& ssh-keygen -A \
&& sed -i "s/#PubkeyAuthentication yes/PubkeyAuthentication yes/" /etc/ssh/sshd_config \
&& echo "sshd enable PubkeyAuthentication "

ADD .ssh /root/.ssh
ADD entrypoint.sh /

EXPOSE 22

ENTRYPOINT  ["/entrypoint.sh"]

