#!/usr/bin/env bash

# Remove Old Image
docker rm -f magento_varnish

# No Cache Build
docker build --no-cache -t magento_varnish -f docker/varnish/Dockerfile .
#docker build -t magento_varnish -f docker/nginx/Dockerfile .

