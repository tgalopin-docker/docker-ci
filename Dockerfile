FROM alpine:latest

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk --update add \
        git \
        curl \
        nodejs \
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
        php7-openssl \
        php7-pdo \
        php7-pdo_pgsql \
        php7-phar \
        php7-session \
        php7-xml \
    && rm -rf /var/cache/apk/* \
    && ln -s /usr/bin/php7 /usr/bin/php \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer \
    && composer global require phpunit/phpunit \
    && ln -s /root/.composer/vendor/bin/phpunit /usr/local/bin/phpunit \
    && npm install -g forever

COPY php.ini /etc/php7/conf.d/50-setting.ini

VOLUME /app
WORKDIR /app
