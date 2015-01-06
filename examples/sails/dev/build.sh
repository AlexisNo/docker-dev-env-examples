#!/bin/bash

# Retrieve current directory
DIR="$( cd "$( dirname "$0" )" && pwd )"

# Create nodejs image
docker build --no-cache=true -t sails-nodejs-image $DIR/dockerfiles/nodejs

# Create nginx image
docker build -t sails-nginx-image $DIR/dockerfiles/nginx
