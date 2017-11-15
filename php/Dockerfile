# PHP Docker image for Yii 2.0 Framework
# ======================================

FROM php:7.1-fpm

#GIT access token
ARG git_api_token

RUN apt-get update && apt-get install -y \
	git \        
	libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libxml2-dev \
	    unzip \
	    supervisor \
    && docker-php-ext-install -j$(nproc) iconv mcrypt pdo_mysql soap mbstring \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

# Install intl
RUN apt-get install -y libicu-dev \
    && docker-php-ext-install intl

# Set timezone
RUN rm /etc/localtime && \
    ln -s /usr/share/zoneinfo/Europe/Warsaw /etc/localtime

# Set config
COPY ./php/config/php.ini /usr/local/etc/php/

# Install composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

# Install CLI packages required for Yii 2.0 Framework globally
RUN composer global require "fxp/composer-asset-plugin:1.*"
RUN composer config --global github-oauth.github.com $git_api_token

# Install xdebug
RUN yes | pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_port=9001" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.idekey=IDE" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.profiler_enable=1" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini
