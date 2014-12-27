#!/bin/bash

# Retrieve current directory
DIR="$( cd "$( dirname "$0" )" && pwd )"

# Create webserver image
echo "Building webserver image"
docker build -t magento-nginx-php-image $DIR/dockerfiles/nginx-php
