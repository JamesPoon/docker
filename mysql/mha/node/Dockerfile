FROM	panshx/centos-sshd

ENV	MHA_HOME=/usr/local/mha

ADD	mha4mysql-node-0.58-0.el7.centos.noarch.rpm $MHA_HOME/mha4mysql-node.rpm

RUN	date \
	&& yum clean all \
	&& yum makecache \
	&& cd $MHA_HOME \
	&& yum localinstall -y mha4mysql-node.rpm \
#	&& yum install -y perl-DBD-MySQL perl-Config-Tiny perl-Log-Dispatch perl-Parallel-ForkManager \
#	&& yum install -y perl-ExtUtils-CBuilder perl-ExtUtils-MakeMaker perl-CPAN \
	&& rm -rf mha4mysql-node.rpm \
	&& yum clean all \
	&& date -R 

WORKDIR $MHA_HOME

