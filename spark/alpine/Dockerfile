FROM 	panshx/jre

ENV 	SCALA_HOME=/usr/local/scala \
        SPARK_HOME=/usr/local/spark \
	PATH=${PATH}:/usr/local/scala/bin:/usr/local/spark/bin

ADD	scala-2.11.12  ${SCALA_HOME}
ADD	spark-2.4.0-bin-hadoop2.7 ${SPARK_HOME}

ADD .ssh /root/.ssh

RUN 	date \
	&& mkdir -p /root/.ssh \
	&& chmod 700 /root/.ssh \
	&& apk update && apk upgrade && apk add openssh bash \
	&& ssh-keygen -A \
#        && rm -rf /etc/localtime \
#        && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
        && sed -i "s/#PubkeyAuthentication yes/PubkeyAuthentication yes/" /etc/ssh/sshd_config \
        && sed -i "s/PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config \
#        && sed -i "s/#PermitRootLogin yes/PermitRootLogin yes/" /etc/ssh/sshd_config \
#        && sed -i "s/UsePAM yes/UsePAM no/" /etc/ssh/sshd_config \
        && sed -i "s/#StrictModes yes/StrictModes no/" /etc/ssh/sshd_config \
	&& date -R
	
EXPOSE 7077

WORKDIR ${SPARK_HOME}

CMD	["/usr/sbin/sshd", "-D"]
