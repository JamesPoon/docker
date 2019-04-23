FROM 	panshx/hadoop-base


ENV     JAVA_HOME=/usr/local/jvm/jre \
        HADOOP_PREFIX=/usr/local/hadoop \
        HADOOP_HOME=/usr/local/hadoop \
        PATH=${PATH}:/usr/bin:/usr/local/jvm/jre/bin:/usr/local/jvm/bin:/usr/local/hadoop/bin

ADD	hadoop-3.2.0 ${HADOOP_HOME}

ADD .ssh /root/.ssh

RUN 	date \
        && chmod 700 /root/.ssh \
        && ln -s /usr/lib/jvm/java /usr/local/jvm \
        && ssh-keygen -A \
        && rm -rf /etc/localtime \
        && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
        && sed -i "s/#PubkeyAuthentication yes/PubkeyAuthentication yes/" /etc/ssh/sshd_config \
        && sed -i "s/PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config \
#        && sed -i "s/#PermitRootLogin yes/PermitRootLogin yes/" /etc/ssh/sshd_config \
#        && sed -i "s/UsePAM yes/UsePAM no/" /etc/ssh/sshd_config \
        && sed -i "s/#StrictModes yes/StrictModes no/" /etc/ssh/sshd_config \
	&& sed -i "s/JAVA_HOME=\${JAVA_HOME}/JAVA_HOME=\/usr\/local\/jvm\/jre/" ${HADOOP_HOME}/etc/hadoop/hadoop-env.sh \
#        && groupadd hadoop \
#        && useradd -g hadoop -d ${HADOOP_HOME} hadoop \
	&& date -R

EXPOSE 8040 9864 8042 8042 9866 9867 9868 9870 8088 8030 8031 8032 8033 8020 38127 

WORKDIR /usr/local/hadoop

#ADD .ssh ${HADOOP_HOME}/.ssh
#RUN chmod 700 ${HADOOP_HOME}/.ssh && chown -R hadoop:hadoop ${HADOOP_HOME}/.ssh

