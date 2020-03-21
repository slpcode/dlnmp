FROM php:7.3.10-fpm-alpine3.10
MAINTAINER <1370808424@qq.com>slpcode
# 安装php扩展
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
#RUN apk add --no-cache tzdata git \
     && apk upgrade \
#RUN apk upgrade \
    && apk add --no-cache tzdata git \
    icu-dev gettext-dev libxml2-dev libzip libzip-dev \
    libmcrypt-dev libjpeg-turbo-dev libpng-dev freetype-dev autoconf g++ make \
    openssl openssl-dev \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && apk del tzdata

#COPY libzip-1.5.2.tar.gz /mytmp/libzip-1.5.2.tar.gz

#RUN cd /mytmp/ \
#    && tar -zxvf libzip-1.5.2.tar.gz \
#    && cd libzip-1.5.2 \
#    && cmake \
#    && make \
#    && make install

RUN docker-php-ext-install bcmath exif gettext intl pcntl shmop soap sockets sysvmsg sysvsem sysvshm zip iconv pdo_mysql mysqli \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ \
    && docker-php-ext-install gd

#RUN pecl install xdebug-2.6.0 \
#RUN pecl install mongodb \
#    && pecl install swoole \
#    && docker-php-ext-enable xdebug \
#    && docker-php-ext-enable mongodb \
#    && docker-php-ext-enable swoole
RUN pecl install mongodb \
   && pecl install swoole \
   && pecl install redis \
#    && docker-php-ext-enable xdebug \
   && docker-php-ext-enable mongodb \
   && docker-php-ext-enable swoole \
   && docker-php-ext-enable redis


COPY --from=composer /usr/bin/composer /usr/bin/composer

ENV PATH $PATH:/composer73/vendor/bin
ENV COMPOSER_HOME /composer73

RUN mkdir /composer73 \
    && /usr/bin/composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
