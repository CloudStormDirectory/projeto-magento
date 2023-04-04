#!/usr/bin/env bash

rm -rf /etc/nginx
cp -R /app/config/nginx /etc
service nginx restart

rm -rf /usr/local/etc/php
rm -rf /usr/local/etc/php-fpm.d
rm -rf /usr/local/etc/php-fpm.conf
cp -R /app/config/php82/* /usr/local/etc

php-fpm -c /usr/local/etc/php-fpm.conf

# Keep Container Running
#tail -f /dev/null
