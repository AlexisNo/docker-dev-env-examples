#!/bin/bash

# Retrieve current directory
DIR="$( cd "$( dirname "$0" )" && pwd )"

# Create nodejs image
docker build -t express-nodejs-image $DIR/dockerfiles/nodejs

# Create nginx image
docker build -t express-nginx-image $DIR/dockerfiles/nginx
