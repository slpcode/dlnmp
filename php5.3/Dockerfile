FROM helder/php-5.3
MAINTAINER <1370808424@qq.com>矢量丿
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak \
    && echo "deb http://mirrors.ustc.edu.cn/debian stable main contrib non-free" >/etc/apt/sources.list \
    && echo "deb-src http://mirrors.ustc.edu.cn/debian stable main contrib non-free" >>/etc/apt/sources.list \
    && echo "deb http://mirrors.ustc.edu.cn/debian stable-proposed-updates main contrib non-free" >>/etc/apt/sources.list \
    && echo "deb-src http://mirrors.ustc.edu.cn/debian stable-proposed-updates main contrib non-free" >>/etc/apt/sources.list \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    # 安装php扩展
    && apt-get update \
    && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng-dev zlib1g-dev libicu-dev g++ libxml2-dev
COPY docker-php-ext-enable /usr/local/bin/
RUN docker-php-ext-install bcmath exif gettext intl pcntl shmop soap sockets sysvmsg sysvsem sysvshm zip iconv mcrypt pdo_mysql mysqli \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd
RUN pecl install xdebug-2.2.7 \
    && docker-php-ext-enable xdebug \
    # 安装supervisor
    && apt-get install -y supervisor
    # composer
COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN mkdir /composer \
    && /usr/bin/composer config -g repo.packagist composer https://packagist.laravel-china.org
RUN apt-get install -y git
ENV PATH $PATH:/composer/vendor/bin
ENV COMPOSER_HOME /composer