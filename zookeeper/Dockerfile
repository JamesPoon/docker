FROM 	panshx/jre

#ADD .ssh /root/.ssh
#ADD entrypoint.sh /

RUN 	date \
	&& apk update \
	&& apk upgrade \
	&& apk add bash \
#        && yum install -y net-tools \
#        && yum install -y openssh openssh-server openssh-clients rsync \
#        && yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel \
#        && chmod 700 /root/.ssh \
#        && ssh-keygen -A \
#        && rm -rf /etc/localtime \
#        && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
#        && sed -i "s/#PubkeyAuthentication yes/PubkeyAuthentication yes/" /etc/ssh/sshd_config \
#        && sed -i "s/PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config \
##        && sed -i "s/#PermitRootLogin yes/PermitRootLogin yes/" /etc/ssh/sshd_config \
##        && sed -i "s/UsePAM yes/UsePAM no/" /etc/ssh/sshd_config \
#        && sed -i "s/#StrictModes yes/StrictModes no/" /etc/ssh/sshd_config \
	&& date -R
	
ENV	ZOOKEEPER_HOME=/usr/local/zookeeper

ADD zookeeper-3.4.13 ${ZOOKEEPER_HOME}

WORKDIR ${ZOOKEEPER_HOME}
#ENTRYPOINT  ["/entrypoint.sh"]

EXPOSE 2181

CMD ["bin/zkServer.sh", "start-foreground"]

