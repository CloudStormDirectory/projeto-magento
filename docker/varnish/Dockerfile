# our base image
FROM varnish:alpine

# specify the port number the container should expose
EXPOSE 80

# User user as root
USER root

# Create App
RUN mkdir /app

# Installing Services
RUN apk update
RUN apk add bash

# Copy Varnish config files
RUN rm -rf /etc/varnish/default.vcl
COPY config/varnish/default.vcl /etc/varnish/default.vcl

## Git
#RUN apk add git
#
## NGinx
#RUN apk add nginx
#RUN rc-update add nginx
#
#RUN rm -rf /etc/nginx
#COPY config/nginx /etc/nginx
#
#RUN rm -rf /usr/local/etc/php && \
#  rm -rf /usr/local/etc/php-fpm.d && \
#  rm -rf /usr/local/etc/php-fpm.conf
#
#COPY config/php82/php /usr/local/etc/php
#COPY config/php82/php-fpm.d /usr/local/etc/php-fpm.d
#COPY config/php82/php-fpm.conf /usr/local/etc/php-fpm.conf
#
## PHP extensions required by Magento
## As seguintes extenções já estão instaladas por padrão, (hash, iconv, json, libxml, openssl, pcre, tokenizer, zlib)
#
#ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
#
#RUN chmod +x /usr/local/bin/install-php-extensions
#
#RUN install-php-extensions \
#  mbstring \
#  bcmath \
#  ctype \
#  curl \
#  dom \
#  fileinfo \
#  filter \
#  gd \
#  intl \
#  pdo_mysql \
#  simplexml \
#  soap \
#  sockets \
#  sodium \
#  xmlwriter \
#  xsl \
#  zip\
#  @composer
#
#RUN apk add ssmtp

# --------------------------------------