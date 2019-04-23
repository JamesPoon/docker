# https://hub.docker.com/r/qbanxiaoli/fastdfs/dockerfile
FROM	alpine:3.8

ENV	LANG=C.UTF-8 \
	SRC_HOME=/usr/local/fastdfs/src \
	FDFS_HOME=/usr/local/fastdfs \
	PATH=${PATH}:/usr/local/nginx/sbin

VOLUME	["${FDFS_HOME}/tracker", "${FDFS_HOME}/storage"]
# 安装准备
RUN	apk update \
        && apk add --no-cache --virtual .build-deps gcc make linux-headers curl gnupg \
	&& apk add --no-cache --virtual .build-deps libc-dev openssl-dev pcre-dev zlib-dev libxslt-dev gd-dev geoip-dev \
# 下载fastdfs、libfastcommon、nginx插件的源码
	&& mkdir -p ${SRC_HOME} \
	&& cd ${SRC_HOME} \
        && curl -fSL https://github.com/happyfish100/libfastcommon/archive/master.tar.gz -o fastcommon.tar.gz \
        && curl -fSL https://github.com/happyfish100/fastdfs/archive/master.tar.gz -o fastfs.tar.gz \
        && curl -fSL https://github.com/happyfish100/fastdfs-nginx-module/archive/master.tar.gz -o nginx-module.tar.gz \
        && tar -zxvf fastcommon.tar.gz \
        && tar -zxvf fastfs.tar.gz \
        && tar -zxvf nginx-module.tar.gz \
# 安装libfastcommon
	&& cd ${SRC_HOME}/libfastcommon-master/ \
	&& echo `pwd` \
        && ./make.sh \
        && ./make.sh install \
# 安装fastdfs
	&& cd ${SRC_HOME}/fastdfs-master/ \
	&& echo `pwd` \
        && ./make.sh \
        && ./make.sh install \
# 获取nginx源码，与fastdfs插件一起编译
	&& cd ${SRC_HOME} \
        && curl -fSL http://nginx.org/download/nginx-1.15.3.tar.gz -o nginx-1.15.3.tar.gz \
        && tar -zxvf nginx-1.15.3.tar.gz \
        && chmod u+x ${SRC_HOME}/fastdfs-nginx-module-master/src/config \
        && cd nginx-1.15.3 \
	&& echo `pwd` \
        && ./configure --add-module=${SRC_HOME}/fastdfs-nginx-module-master/src \
        && make && make install \
# 配置fastdfs: base_dir
	&& cd /etc/fdfs/ \
        && cp storage.conf.sample storage.conf \
        && cp tracker.conf.sample tracker.conf \
        && cp client.conf.sample client.conf \
        && sed -i "s|/home/yuqing/fastdfs|/usr/local/fastdfs/tracker|g" /etc/fdfs/tracker.conf \
        && sed -i "s|/home/yuqing/fastdfs|/usr/local/fastdfs/storage|g" /etc/fdfs/storage.conf \
        && sed -i "s|/home/yuqing/fastdfs|/usr/local/fastdfs/storage|g" /etc/fdfs/client.conf \
# 设置nginx和fastdfs联合环境，并配置nginx
	&& cp ${SRC_HOME}/fastdfs-nginx-module-master/src/mod_fastdfs.conf /etc/fdfs/ \
        && sed -i "s|^store_path0.*$|store_path0=/usr/local/fastdfs/storage|g" /etc/fdfs/mod_fastdfs.conf \
        && sed -i "s|^url_have_group_name =.*$|url_have_group_name = true|g" /etc/fdfs/mod_fastdfs.conf \
        && cd ${SRC_HOME}/fastdfs-master/conf/ \
        && cp http.conf mime.types anti-steal.jpg /etc/fdfs/ \
        && echo -e "\
events {\n\
	worker_connections  1024;\n\
}\n\
http {\n\
	include       mime.types;\n\
	default_type  application/octet-stream;\n\
	server {\n\
		listen 8080;\n\
		server_name localhost;\n\
		location ~ /group[0-9]/M00 {\n\
			ngx_fastdfs_module;\n\
		}\n\
	}\n\
}" > /usr/local/nginx/conf/nginx.conf \
# 清理文件
	&& rm -rf ${SRC_HOME} \
#    	&& mkdir -p /usr/local/fastdfs \
	&& apk del .build-deps gcc libc-dev make openssl-dev linux-headers curl gnupg libxslt-dev gd-dev geoip-dev pcre-dev zlib-dev \
	&& apk add --no-cache --virtual .build-deps bash pcre openssl \
	&& date 

WORKDIR	${FDFS_HOME}
# 配置启动脚本，在启动时中根据环境变量替换nginx端口、fastdfs端口
# 默认nginx端口 8080
# 默认fastdfs端口 22122 
EXPOSE 22122 23000 8888

CMD	["tail", "-f", "/dev/null"]
