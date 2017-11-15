FROM codeception/codeception:latest

RUN apt-get update && apt-get install -y \
        libxml2-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        && docker-php-ext-install -j$(nproc) pdo_mysql \
        && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
        && docker-php-ext-install -j$(nproc) gd