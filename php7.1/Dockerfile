FROM php:7.1-fpm
MAINTAINER <1370808424@qq.com>矢量丿
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
    echo "deb http://mirrors.ustc.edu.cn/debian stable main contrib non-free" >/etc/apt/sources.list && \
    echo "deb-src http://mirrors.ustc.edu.cn/debian stable main contrib non-free" >>/etc/apt/sources.list && \
    echo "deb http://mirrors.ustc.edu.cn/debian stable-proposed-updates main contrib non-free" >>/etc/apt/sources.list && \
    echo "deb-src http://mirrors.ustc.edu.cn/debian stable-proposed-updates main contrib non-free" >>/etc/apt/sources.list
RUN apt-get update \
    && apt-get install -y libfreetype6-dev \
    && apt-get install -y libjpeg62-turbo-dev \
    && apt-get install -y libmcrypt-dev \
    && apt-get install -y libpng-dev \
    && docker-php-ext-install -j$(nproc) iconv mcrypt pdo_mysql mysqli\
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd
RUN echo "Asia/Shanghai" > /etc/timezone
COPY php.ini /usr/local/etc/php/