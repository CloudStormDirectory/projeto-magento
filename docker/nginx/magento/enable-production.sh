#!/usr/bin/env bash

# https://experienceleague.adobe.com/docs/commerce-operations/configuration-guide/cache/varnish/config-varnish-install.html?lang=en

cd /app/www/magento2
bin/magento deploy:mode:set production

