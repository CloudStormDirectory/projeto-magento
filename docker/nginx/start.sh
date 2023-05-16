#!/usr/bin/env bash

# Update NGinx config files
rm -rf /etc/nginx
cp -R /app/config/nginx /etc
service nginx restart

# Install Magento if it's not there yet
if [ ! -f "/app/www/magento2/setup.lock" ]; then

  echo "Installing Magento Keys"
  cp /app/.magento /root/.composer/auth.json
  mkdir var/composer_home
  cp /app/.magento /app/www/magento2/var/composer_home/auth.json

  echo "Installing Magento..."
  cd /app/www/magento2
  composer install
  #composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition magento2
  #cd magento2

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

  echo "Disable 2FA on Magento"
  bin/magento module:disable Magento_AdminAdobeImsTwoFactorAuth --clear-static-content
  bin/magento module:disable Magento_TwoFactorAuth --clear-static-content
  bin/magento setup:di:compile
  bin/magento cache:flush

  echo "Remove writing permissions from directory"
  # chmod 664 -R /app/www/magento2/app/etc

  echo "Install Magento Cron Jobs"
  cd /app/www/magento2/
  bin/magento cron:install

  echo "Run indexer"
  bin/magento indexer:reindex catalogrule_product
  bin/magento indexer:reindex catalogrule_rule
  bin/magento indexer:reindex catalogsearch_fulltext
  bin/magento indexer:reindex catalog_category_product
  bin/magento indexer:reindex customer_grid
  bin/magento indexer:reindex design_config_grid
  bin/magento indexer:reindex inventory
  bin/magento indexer:reindex catalog_product_category
  bin/magento indexer:reindex catalog_product_attribute
  bin/magento indexer:reindex catalog_product_price
  bin/magento indexer:reindex cataloginventory_stock
  bin/magento indexer:status

  # https://experienceleague.adobe.com/docs/commerce-operations/installation-guide/tutorials/backup.html?lang=en
  echo "Enable Backups and Restore"
  bin/magento config:set system/backup/functionality_enabled 1

  echo "Setting up Varnish configuration"
  bin/magento setup:config:set --http-cache-hosts=varnish.docker

  cd ..
  echo "Magento Installed"
else
  echo "Magento OK"
fi

# Setup SSMTP service to send emails from PHP
rm /etc/ssmtp/ssmtp.conf
echo -e "root=postmaster \n\
mailhub=${MAIL_HOST}:${MAIL_PORT} \n\
FromLineOverride=YES \n\
UseSTARTTLS=${MAIL_TLS} \n\
" > /etc/ssmtp/ssmtp.conf

if [ ! -z "$MAIL_USER"]; then
  echo -e "AuthUser=${MAIL_USER}\n" >> /etc/ssmtp/ssmtp.conf
fi
if [ ! -z "$MAIL_PASS"]; then
  echo -e "AuthPass=${MAIL_PASS}\n" >> /etc/ssmtp/ssmtp.conf
fi
if [ ! -z "$MAIL_DOMAIN"]; then
  echo -e "hostname=${MAIL_DOMAIN}\nrewriteDomain=${MAIL_DOMAIN}\n" >> /etc/ssmtp/ssmtp.conf
fi

# Start PHP FPM as the main process of this container
php-fpm -c /usr/local/etc/php-fpm.conf &

# Keep Container Running
tail -f /dev/null












