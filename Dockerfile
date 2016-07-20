FROM docker:dind

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk --update add \
        git \
        curl \
        php7 \
        php7-amqp \
        php7-curl \
        php7-ctype \
        php7-dom \
        php7-fpm \
        php7-gd \
        php7-iconv \
        php7-intl \
        php7-json \
        php7-mbstring \
        php7-mcrypt \
        php7-mysqlnd \
        php7-opcache \
        php7-openssl \
        php7-pdo \
        php7-pdo_pgsql \
        php7-phar \
        php7-posix \
        php7-session \
        php7-xml \
    && rm -rf /var/cache/apk/* \
    && ln -s /usr/bin/php7 /usr/bin/php \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
    && ln -s /usr/bin/php7 /usr/bin/php

COPY php.ini /etc/php7/conf.d/50-setting.ini

VOLUME /app
WORKDIR /app
