
FROM alpine
MAINTAINER k <k@kdaye.com>

ARG SSR_VER=2.4.1
ARG SSR_URL=https://github.com/shadowsocksr/shadowsocksr-libev/archive/$SSR_VER.tar.gz

RUN set -ex \
            && if [ $(wget -qO- ipinfo.io/country) == CN ]; then echo "http://mirrors.aliyun.com/alpine/latest-stable/main/" > /etc/apk/repositories ;fi \
            && apk add --no-cache --virtual .build-deps \
                                autoconf \
                                build-base \
                                curl \
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
    curl -sSL $SSR_URL | tar xz --strip 1 && \
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

USER nobody

EXPOSE $SERVER_PORT/tcp $SERVER_PORT/udp
EXPOSE $LOCAL_PORT/tcp $LOCAL_PORT/udp
