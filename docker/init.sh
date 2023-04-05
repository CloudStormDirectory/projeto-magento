#!/usr/bin/env bash

cd /www
git clone https://github.com/magento/magento2.git magento
cd ../

# Build Docker images
echo "Building Docker Images..."
./docker/build.sh

echo "Starting up Docker Containers..."
./docker/up.sh
