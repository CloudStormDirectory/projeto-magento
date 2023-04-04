#!/usr/bin/env bash

# Remove Old Image
docker rm -f magento_mysql

# No Cache Build
docker build --no-cache -t magento_mysql -f docker/mysql/Dockerfile .

