#!/usr/bin/env bash

# Remove Old Image
docker rm -f magento_elasticsearch

# No Cache Build
docker build --no-cache -t magento_elasticsearch -f docker/elasticsearch/Dockerfile .

