FROM helder/php-5.3
MAINTAINER <1370808424@qq.com>矢量丿
COPY ./sources.list /sources.list
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak \
    && cp /sources.list /etc/apt/sources.list \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    # 安装php扩展
    && apt-get update \
    && apt-get install -y --no-install-recommends libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng-dev zlib1g-dev libicu-dev g++ libxml2-dev \
    && rm -rf /var/lib/apt/lists/*
COPY docker-php-ext-enable /usr/local/bin/
RUN docker-php-ext-install bcmath exif gettext intl pcntl shmop soap sockets sysvmsg sysvsem sysvshm zip iconv mcrypt pdo_mysql mysqli \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd
RUN apt-get update \
    && pecl install xdebug-2.2.7 \
    && docker-php-ext-enable xdebug \
    # 安装supervisor
    && apt-get update \
    && apt-get install -y --no-install-recommends supervisor \
    && rm -rf /var/lib/apt/lists/*
    # composer
COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN mkdir /composer \
    && /usr/bin/composer config -g repo.packagist composer https://packagist.laravel-china.org
RUN apt-get update \
    && apt-get install -y --no-install-recommends git \
    && rm -rf /var/lib/apt/lists/*
ENV PATH $PATH:/composer/vendor/bin
ENV COMPOSER_HOME /composer