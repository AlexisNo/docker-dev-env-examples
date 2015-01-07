#!/bin/bash

# Retrieve current directory
DIR="$( cd "$( dirname "$0" )" && pwd )"

# Destroy previous containers
${DIR}/rm.sh

# Create mailcatcher container
echo "Running mailcatcher container"
docker run -d -p 1080:1080 -p 1025:1025 --name sails-mailcatcher alexisno/mailcatcher

# Create mongodb container
echo "Running mongodb container"
docker run -d --name sails-mongodb alexisno/mongodb

# Run node.js container
echo "Running node.js container"
docker run -d -p 1337:1337 \
           -v $DIR/../src:/var/www/my-sails-app \
           -v $DIR/data/log/forever:/var/log/forever \
           --link sails-mailcatcher:mailcatcher \
           --link sails-mongodb:db \
           --name sails-nodejs \
           sails-nodejs-image

# Run node container
echo "Running nginx container"
docker run -d -p 80:80 --link sails-mailcatcher:mailcatcher --name sails-nginx sails-nginx-image
