FROM centos

ENV TZ=Asia/Shanghai 

RUN 	date \
        && yum install -y net-tools \
        && yum install -y openssh openssh-server openssh-clients rsync \
        && yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel \
        && ssh-keygen -A \
#        && rm -rf /etc/localtime \
#        && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
	&& echo $TZ > /etc/timezone \
	&& date -R
	
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]

