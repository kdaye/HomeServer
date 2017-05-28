
FROM alpine
MAINTAINER k <k@kdaye.com>

RUN set -ex \
            && if [ $(wget -qO- ipinfo.io/country) == CN ]; then echo "http://mirrors.aliyun.com/alpine/latest-stable/main/" > /etc/apk/repositories ;fi \
            && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	    && echo "Asia/Shanghai" > /etc/timezone \
	    && apk add --no-cache --virtual .build-deps \
                                autoconf \
                                build-base \
                                git \
                                libev-dev \
                                libtool \
                                linux-headers \
                                udns-dev \
                                libsodium-dev \
                                pcre-dev \
                                tar \
                                zlib-dev \
                                openssl-dev \
                                udns-dev && \
    cd /tmp && \
    git clone https://github.com/shadowsocksr/shadowsocksr-libev.git  && \
    cd shadowsocksr-libev &&\
    ./configure --prefix=/usr --disable-documentation && \
    make install && \
    cd .. && \

    runDeps="$( \
        scanelf --needed --nobanner /usr/bin/ss-* \
            | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
            | xargs -r apk info --installed \
            | sort -u \
    )" && \
    apk add --no-cache --virtual .run-deps $runDeps && \
    apk del .build-deps && \
    rm -rf /tmp/*


EXPOSE 1080/tcp 1080/udp 1081/tcp

ADD config.json /etc/config.json
ADD start.sh start.sh
RUN chmod +x start.sh
CMD ["/bin/sh","start.sh"]
