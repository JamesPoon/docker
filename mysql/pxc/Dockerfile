FROM 	centos

ENV 	TZ=Asia/Shanghai \
	MYSQL_HOME=/usr/local/mysql \
	PERCONA_HOME=/usr/local/percona 

VOLUME ["${MYSQL_HOME}/data", "${MYSQL_HOME}/logs"]

ADD	Percona-XtraDB-Cluster-5.7.25-31.35-r463-el7-x86_64-bundle.tar ${PERCONA_HOME}

RUN	date \ 	
	&& ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
	&& echo $TZ > /etc/timezone \
	&& yum install -y https://www.percona.com/redir/downloads/percona-release/redhat/percona-release-0.1-4.noarch.rpm \
	&& yum install -y epel-release net-tools rsync \
	&& yum makecache \
	&& cd ${PERCONA_HOME} \
	&& yum localinstall -y Percona-XtraDB-Cluster-57-5.7.25-31.35.1.el7.x86_64.rpm Percona-XtraDB-Cluster-client-57-5.7.25-31.35.1.el7.x86_64.rpm Percona-XtraDB-Cluster-server-57-5.7.25-31.35.1.el7.x86_64.rpm Percona-XtraDB-Cluster-shared-57-5.7.25-31.35.1.el7.x86_64.rpm Percona-XtraDB-Cluster-shared-compat-57-5.7.25-31.35.1.el7.x86_64.rpm \
	&& rm -rf ${PERCONA_HOME} \
#        && yum install -y openssh openssh-clients openssh-server \
#        && ssh-keygen -A \
#	&& yum install -y socat libev openssl \
#	&& yum install -y openssl-devel perl-IO-Socket-SSL.noarch perl-DBD-MySQL.x86_64 perl-Time-HiRes\
#	&& yum clean all \
# 	&& date -R
#RUN	date \ 	
#	&& rpmkeys --import https://www.percona.com/downloads/RPM-GPG-KEY-percona \
#	&& yum install -y Percona-XtraDB-Cluster-57 \
	&& chown -R mysql:mysql ${MYSQL_HOME}/data ${MYSQL_HOME}/logs \
	&& yum clean all \
 	&& date -R
	
WORKDIR $MYSQL_HOME

#CMD ["/usr/sbin/sshd", "-D"]

