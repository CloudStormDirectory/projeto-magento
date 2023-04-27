#!/usr/bin/env bash

# https://experienceleague.adobe.com/docs/commerce-operations/configuration-guide/cache/varnish/config-varnish-install.html?lang=en

cd /app/www/magento2
rm -rf /app/www/magento2/generated/metadata/*
rm -rf /app/www/magento2/generated/code/*
bin/magento deploy:mode:set default
bin/magento setup:di:compile
bin/magento cache:flush

