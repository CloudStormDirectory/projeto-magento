#!/usr/bin/env bash

rm -rf www
mkdir www
cd www/
git clone git@github.com:CloudStormDirectory/projeto-magento-app.git magento2

# Build Docker images
echo "Building Docker Images..."
./docker/build.sh

echo "Starting up Docker Containers..."
./docker/up.sh
