FROM php:7.2.8-fpm-alpine3.7
MAINTAINER <1370808424@qq.com>矢量丿
# 安装php扩展
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk add --no-cache tzdata git \
    icu-dev gettext-dev libxml2-dev \
    libmcrypt-dev libjpeg-turbo-dev libpng-dev freetype-dev autoconf g++ make \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && apk del tzdata

RUN docker-php-ext-install bcmath exif gettext intl pcntl shmop soap sockets sysvmsg sysvsem sysvshm zip iconv pdo_mysql mysqli \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ \
    && docker-php-ext-install gd

RUN pecl install xdebug-2.6.0 \
    && docker-php-ext-enable xdebug

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN mkdir /composer \
    && /usr/bin/composer config -g repo.packagist composer https://packagist.laravel-china.org \
    && /usr/bin/composer selfupdate

ENV PATH $PATH:/composer/vendor/bin

ENV COMPOSER_HOME /composer