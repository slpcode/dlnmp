#FROM php:7.1.20-fpm-alpine3.7
FROM php:7.1.33-fpm-alpine3.10
MAINTAINER <1370808424@qq.com>slpcode
# 安装php扩展
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk add --no-cache tzdata git \
    icu-dev gettext-dev libxml2-dev \
    libmcrypt-dev libjpeg-turbo-dev libpng-dev freetype-dev autoconf g++ make imagemagick imagemagick-dev \
    openssl openssl-dev \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && apk del tzdata

RUN docker-php-ext-install bcmath exif gettext intl pcntl shmop soap sockets sysvmsg sysvsem sysvshm zip iconv mcrypt pdo_mysql mysqli \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ \
    && docker-php-ext-install gd

RUN pecl install xdebug-2.6.0 \
RUN pecl install mongodb \
    && pecl install imagick \
    && pecl install swoole \
    && pecl install redis \
    && docker-php-ext-enable xdebug \
    && docker-php-ext-enable mongodb \
    && docker-php-ext-enable swoole \
    && docker-php-ext-enable imagick \
    && docker-php-ext-enable redis

COPY --from=composer /usr/bin/composer /usr/bin/composer

ENV PATH $PATH:/composer71/vendor/bin
ENV COMPOSER_HOME /composer71

RUN mkdir /composer71 \
#    && /usr/bin/composer selfupdate \
    && /usr/bin/composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ \
    && composer global require symfony/var-dumper -vvv
