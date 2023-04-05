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

# NGinx
RUN apk add nginx
RUN rc-update add nginx

RUN rm -rf /etc/nginx
COPY config/nginx /etc/nginx

RUN rm -rf /usr/local/etc/php
RUN rm -rf /usr/local/etc/php-fpm.d
RUN rm -rf /usr/local/etc/php-fpm.conf
COPY config/php82/* /usr/local/etc

# Magento Dependencies
apk add oniguruma-dev
docker-php-ext-install mbstring

docker-php-ext-install bcmath
docker-php-ext-install ctype

apk add curl-dev
docker-php-ext-install curl

apk add libxml2-dev
docker-php-ext-install dom

docker-php-ext-install fileinfo
docker-php-ext-install filter

apk add libpng-dev
docker-php-ext-install gd

docker-php-ext-install hash *
docker-php-ext-install iconv *

apk add icu-dev
docker-php-ext-install intl

docker-php-ext-install json *

docker-php-ext-install libxml *
docker-php-ext-install openssl *
docker-php-ext-install pcre *

docker-php-ext-install pdo_mysql
docker-php-ext-install simplexml
docker-php-ext-install soap
docker-php-ext-install sockets *

apk add libsodium-dev
docker-php-ext-install sodium

docker-php-ext-install tokenizer *
docker-php-ext-install xmlwriter

apk add libxslt-dev
docker-php-ext-install xsl

apk add libzip-dev
docker-php-ext-install zip

docker-php-ext-install zlib *

docker-php-ext-install lib-libxml *


RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

# PHP
#RUN apk add php81
#RUN apk add php81-fpm
#RUN apk add php81-pdo_mysql
#RUN apk add php81-mysqli
#RUN apk add php81-mbstring
#RUN apk add php81-xmlreader
#RUN apk add php81-curl
#RUN apk add php81-iconv
#RUN apk add php81-zip
#RUN apk add php81-gd
#RUN apk add php81-fpm
