FROM	panshx/mha-node

ENV	MHA_HOME=/usr/local/mha

ADD	mha4mysql-manager-0.58-0.el7.centos.noarch.rpm $MHA_HOME/mha4mysql-manager.rpm

RUN	date \
	&& yum clean all \
	&& yum makecache \
	&& cd $MHA_HOME \
	&& yum localinstall -y mha4mysql-manager.rpm \
	&& rm -rf mha4mysql-manager.rpm \
	&& yum clean all \
	&& date -R 

WORKDIR $MHA_HOME

