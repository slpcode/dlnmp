FROM php:7.1-fpm
MAINTAINER <1370808424@qq.com>矢量丿
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
    echo "deb http://mirrors.ustc.edu.cn/debian stable main contrib non-free" >/etc/apt/sources.list && \
    echo "deb-src http://mirrors.ustc.edu.cn/debian stable main contrib non-free" >>/etc/apt/sources.list && \
    echo "deb http://mirrors.ustc.edu.cn/debian stable-proposed-updates main contrib non-free" >>/etc/apt/sources.list && \
    echo "deb-src http://mirrors.ustc.edu.cn/debian stable-proposed-updates main contrib non-free" >>/etc/apt/sources.list
RUN apt-get update \
    && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng-dev zlib1g-dev libicu-dev g++ libxml2-dev \
    && docker-php-ext-install -j$(nproc) bcmath exif gettext intl pcntl shmop soap sockets sysvmsg sysvsem sysvshm zip iconv mcrypt pdo_mysql mysqli \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
#COPY php.ini /usr/local/etc/php/