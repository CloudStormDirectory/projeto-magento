#!/usr/bin/env bash

docker-compose down
rm -rf data
rm -rf www
./docker/build.sh