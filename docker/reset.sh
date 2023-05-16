#!/usr/bin/env bash

docker-compose down
rm -rf data
rm -rf www
mkdir www
git clone git@github.com:CloudStormDirectory/projeto-magento-app.git magento2

./docker/build.sh