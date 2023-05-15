#!/usr/bin/env bash

# https://devdocs.magento.com/guides/v2.3/config-guide/cli/config-cli-subcommands-perf-data.html

cd /app/www/magento2
export PATH=$PATH:/app/www/magento2/bin
bin/magento setup:perf:generate-fixtures /app/www/magento2/setup/performance-toolkit/profiles/ce/medium.xml
bin/magento indexer:reindex
