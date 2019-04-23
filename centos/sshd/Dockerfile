FROM 	centos

ENV TZ=Asia/Shanghai 

RUN	date \ 
	&& yum makecache \
	&& yum install -y epel-release openssh openssh-clients openssh-server \
        && yum install -y net-tools rsync \
        && ssh-keygen -A \
#        && rm -rf /etc/localtime \
#        && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
	&& echo $TZ > /etc/timezone \
	&& yum clean all \
 	&& date -R

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]

