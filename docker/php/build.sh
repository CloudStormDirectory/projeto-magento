#!/usr/bin/env bash

# Remove Old Image
docker rm -f magento_nginx

# No Cache Build
docker build --no-cache -t magento_nginx -f docker/php/Dockerfile .

