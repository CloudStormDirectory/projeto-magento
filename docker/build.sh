#!/usr/bin/env bash

# NGinx
./docker/nginx/build.sh
./docker/varnish/build.sh
./docker/mysql/build.sh
./docker/elasticsearch/build.sh
