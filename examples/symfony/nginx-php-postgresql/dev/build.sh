#!/bin/bash

# Retrieve current directory
DIR="$( cd "$( dirname "$0" )" && pwd )"

# Create webserver image
echo "Building webserver image"
docker build -t symfony-nginx-php-image $DIR/dockerfiles/nginx-php
