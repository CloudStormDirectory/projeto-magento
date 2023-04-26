#!/usr/bin/env bash

rm -rf /etc/nginx
cp -R /app/config/nginx /etc
service nginx restart

#if [ ! -d "/app/www/magento" ]; then
#  if [ ! -d "/app/www" ]; then
#    mkdir /app/www
#  fi
#  echo "Cloning Magento..."
#  cd /app/www
#  git clone https://github.com/magento/magento2.git magento
#  cd magento
#  composer install
#  cd ..
#  echo "Magento cloned"
#else
#  echo "Magento OK"
#fi

if [ ! -d "/app/www/magento2" ]; then
  if [ ! -d "/app/www" ]; then
    mkdir /app/www
  fi

  echo "Installing Magento Keys"
  cp /app/.magento /root/.composer/auth.json

  echo "Installing Magento..."
  cd /app/www
  composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition magento2
  cd magento2

  echo "Installing APP parameters"
  bin/magento setup:install \
  --base-url=http://www.magento.dvp \
  --db-host=${MYSQL_HOST} \
  --db-name=${MYSQL_DATABASE} \
  --db-user=${MYSQL_USER} \
  --db-password=${MYSQL_PASSWORD} \
  --admin-firstname=${MG_ADMIN_FIRSTNAME} \
  --admin-lastname=${MG_ADMIN_LASTNAME} \
  --admin-email=${MG_ADMIN_EMAIL} \
  --admin-user=${MG_ADMIN_USER} \
  --admin-password=${MG_ADMIN_PASSWORD} \
  --language=${MG_LANGUAGE} \
  --currency=${MG_CURRENCY} \
  --timezone=${MG_TIMEZONE} \
  --use-rewrites=1 \
  --search-engine=elasticsearch7 \
  --elasticsearch-host=${ES_HOST} \
  --elasticsearch-port=${ES_PORT} \
  --backend-frontname=admin

  echo "Setting up Sendmail host and port"
  bin/magento config:set system/smtp/host mail.docker
  bin/magento config:set system/smtp/port 25

  cd ..
  echo "Magento Installed"
else
  echo "Magento OK"
fi

php-fpm -c /usr/local/etc/php-fpm.conf

# Keep Container Running
#tail -f /dev/null
