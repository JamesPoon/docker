FROM	panshx/mha-node

ENV	MYSQL_HOME=/usr/local/mysql

ADD	mysql-community.repo /etc/yum.repos.d/
ADD	RPM-GPG-KEY-mysql /etc/pki/rpm-gpg/

RUN	date \
	&& yum makecache \
	&& rpm --import /etc/pki/rpm-gpg/RPM* \
#	&& yum install -y mysql57-community-release \
#	&& yum install -y mysql-community-libs mysql-community-common \
	&& yum install -y mysql-community-server mysql-community-client \
	&& yum clean all \
	&& date -R 

WORKDIR $MYSQL_HOME

