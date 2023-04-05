#!/usr/bin/env bash

rm -rf /etc/nginx
cp -R /app/config/nginx /etc
service nginx restart

rm -rf /usr/local/etc/php
rm -rf /usr/local/etc/php-fpm.d
rm -rf /usr/local/etc/php-fpm.conf
cp -R /app/config/php82/* /usr/local/etc

if [ ! -d "/app/www/magento" ]; then
  if [ ! -d "/app/www" ]; then
    mkdir /app/www
  fi
  echo "Cloning Magento..."
  cd /app/www
  git clone https://github.com/magento/magento2.git magento
  cd magento
  composer install
  cd ..
  echo "Magento cloned"
else
  echo "Magento OK"
fi

php-fpm -c /usr/local/etc/php-fpm.conf

# Keep Container Running
#tail -f /dev/null
