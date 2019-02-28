FROM        centos:7

# install sshd
ADD .ssh /root/.ssh

ENV     JAVA_HOME=/usr/lib/jvm/jre \
        HADOOP_PREFIX=/usr/local/hadoop \
        HADOOP_HOME=/usr/local/hadoop \
        PATH=${PATH}:/usr/bin:/usr/lib/jvm/jre/bin:/usr/lib/jvm/bin:/usr/local/hadoop/bin:/usr/local/hadoop/sbin

RUN date \
        && yum install -y net-tools \
        && yum install -y openssh openssh-server openssh-clients rsync \
        && yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel \
        && chmod 700 /root/.ssh \
        && ssh-keygen -A \
        && rm -rf /etc/localtime \
        && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
        && sed -i "s/#PubkeyAuthentication yes/PubkeyAuthentication yes/" /etc/ssh/sshd_config \
        && sed -i "s/PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config \
#        && sed -i "s/#PermitRootLogin yes/PermitRootLogin yes/" /etc/ssh/sshd_config \
#        && sed -i "s/UsePAM yes/UsePAM no/" /etc/ssh/sshd_config \
        && sed -i "s/#StrictModes yes/StrictModes no/" /etc/ssh/sshd_config \
        && mkdir -p /usr/local \
        && curl -jksSL -o /tmp/hadoop-3.2.0.tar.gz http://mirrors.shu.edu.cn/apache/hadoop/common/hadoop-3.2.0/hadoop-3.2.0.tar.gz \
        && tar -C /usr/local/ -zxf /tmp/hadoop-3.2.0.tar.gz \
        && ln -s /usr/local/hadoop-3.2.0 /usr/local/hadoop \
        && groupadd hadoop \
        && useradd -g hadoop -d ${HADOOP_HOME} hadoop \
        && echo "installed"

WORKDIR /usr/local/hadoop

# USER hdfs

# ADD .ssh ~/.ssh

CMD ["/usr/sbin/init"]

