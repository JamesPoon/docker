FROM centos

ENV 	JVM_HOME=/usr/local/jvm \
	JAVA_HOME=/usr/local/jvm/jre \
        SCALA_HOME=/usr/local/scala \
        SPARK_HOME=/usr/local/spark \
	PATH=${PATH}:/usr/local/jvm/jre/bin:/usr/local/jvm/bin:/usr/local/scala/bin:/usr/local/spark/bin

#ADD 	jdk1.8.0_201 ${JAVA_HOME}
ADD	scala-2.11.12  ${SCALA_HOME}
ADD	spark-2.4.0-bin-hadoop2.7 ${SPARK_HOME}

ADD .ssh /root/.ssh

RUN date \
        && yum install -y net-tools \
        && yum install -y openssh openssh-server openssh-clients rsync \
        && yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel \
        && chmod 700 /root/.ssh \
        && ssh-keygen -A \
        && rm -rf /etc/localtime \
        && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
        && mkdir -p /usr/local \
        && ln -s /usr/lib/jvm/java ${JVM_HOME} \
        && sed -i "s/#PubkeyAuthentication yes/PubkeyAuthentication yes/" /etc/ssh/sshd_config \
        && sed -i "s/PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config \
#        && sed -i "s/#PermitRootLogin yes/PermitRootLogin yes/" /etc/ssh/sshd_config \
#        && sed -i "s/UsePAM yes/UsePAM no/" /etc/ssh/sshd_config \
        && sed -i "s/#StrictModes yes/StrictModes no/" /etc/ssh/sshd_config \
	&& date -R
	
ADD entrypoint.sh /

EXPOSE 22 7077

ENTRYPOINT  ["/entrypoint.sh"]

WORKDIR /usr/local/spark

