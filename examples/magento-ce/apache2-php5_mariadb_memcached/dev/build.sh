#!/bin/bash

# Retrieve current directory
DIR="$( cd "$( dirname "$0" )" && pwd )"

# Create webserver image
echo "Building webserver image"
docker build --no-cache=true -t magento-ce-apache2-php5-image $DIR/dockerfiles/apache2-php5
