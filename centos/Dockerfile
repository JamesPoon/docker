FROM 	centos:7

ENV TZ=Asia/Shanghai 

RUN	date \ 
	&& yum makecache \
        && yum install -y epel-release net-tools rsync \
	&& ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
	&& echo $TZ > /etc/timezone \
	&& yum clean all \
 	&& date -R

