FROM centos:latest
MAINTAINER jbr.osama@gmail.com, osama.j@opensooq.com

RUN yum update -y && \
    yum install -y vim zlib pcre-* openssl-* wget && \
    yum groupinstall -y "Development Tools" && \
    curl -o /usr/local/bin/confd -sSL https://github.com/kelseyhightower/confd/releases/download/v0.11.0/confd-0.11.0-linux-amd64 && \
    mkidr /app/ && \
    wget http://nginx.org/download/nginx-1.10.1.tar.gz -o nginx.tgz && \
    tar zxvf nginx-1.10.1.tar.gz && \
    cd nginx-1.10.1

ADD confd /app/confd
ADD start.sh /

RUN ./configure \ 
        --sbin-path=/usr/local/nginx/nginx \
        --conf-path=/usr/local/nginx/nginx.conf \
        --pid-path=/usr/local/nginx/nginx.pid \
        --with-pcre \
        --with-http_ssl_module \
        --with-stream \
        --with-mail=dynamic \
        --with-http_gzip_static_module \
        --with-http_ssl_module \
        --with-http_stub_status_module \
        --with-file-aio && \
    make && make install

ENTRYPOINT ["/start.sh"]
