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
COPY config/php82/php /usr/local/etc/php
COPY config/php82/php-fpm.d /usr/local/etc/php-fpm.d
COPY config/php82/php-fpm.conf /usr/local/etc/php-fpm.conf

# PHP extensions required by Magento
# As seguintes extenções já estão instaladas por padrão, (hash, iconv, json, libxml, openssl, pcre, tokenizer, zlib)

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions

RUN install-php-extensions mbstring
RUN install-php-extensions bcmath
RUN install-php-extensions ctype
RUN install-php-extensions curl
RUN install-php-extensions dom
RUN install-php-extensions fileinfo
RUN install-php-extensions filter
RUN install-php-extensions gd
RUN install-php-extensions intl
RUN install-php-extensions pdo_mysql
RUN install-php-extensions simplexml
RUN install-php-extensions soap
RUN install-php-extensions sockets
RUN install-php-extensions sodium
RUN install-php-extensions xmlwriter
RUN install-php-extensions xsl
RUN install-php-extensions zip
RUN install-php-extensions @composer




