# our base image
FROM php:8.2-fpm-alpine3.17

# specify the port number the container should expose
EXPOSE 80

# User user as root
USER root

# Create App
RUN mkdir /app

# Installing Services
RUN apk update
RUN apk add bash
RUN apk add openrc
RUN mkdir /run/openrc && touch /run/openrc/softlevel
RUN rc-status

# Git
RUN apk add git

# NGinx
RUN apk add nginx
RUN rc-update add nginx

RUN rm -rf /etc/nginx
COPY config/nginx /etc/nginx

RUN rm -rf /usr/local/etc/php
RUN rm -rf /usr/local/etc/php-fpm.d
RUN rm -rf /usr/local/etc/php-fpm.conf
COPY config/php82/* /usr/local/etc

# PHP extensions required by Magento
# As seguintes extenções já estão instaladas por padrão, (hash, iconv, json, libxml, openssl, pcre, tokenizer, zlib)

RUN apk add oniguruma-dev
RUN docker-php-ext-install mbstring

RUN docker-php-ext-install bcmath
RUN docker-php-ext-install ctype

RUN apk add curl-dev
RUN docker-php-ext-install curl

RUN apk add libxml2-dev
RUN docker-php-ext-install dom

RUN docker-php-ext-install fileinfo
RUN docker-php-ext-install filter

RUN apk add libpng-dev
RUN docker-php-ext-install gd

RUN apk add icu-dev
RUN docker-php-ext-install intl

RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install simplexml
RUN docker-php-ext-install soap

RUN apk add --no-cache linux-headers
RUN docker-php-ext-install sockets

RUN apk add libsodium-dev
RUN docker-php-ext-install sodium

RUN docker-php-ext-install xmlwriter

RUN apk add libxslt-dev
RUN docker-php-ext-install xsl

RUN apk add libzip-dev
RUN docker-php-ext-install zip

# Instalando o PHP Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer





