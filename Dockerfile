FROM docker:dind

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk --update add \
        git \
        curl \
        php7 \
        php7-curl \
        php7-json \
        php7-mcrypt \
        php7-iconv \
        php7-phar \
        php7-openssl \
    && rm -rf /var/cache/apk/* \
    && ln -s /usr/bin/php7 /usr/bin/php \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer