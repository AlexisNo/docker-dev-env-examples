#!/bin/bash

# Retrieve current directory
DIR="$( cd "$( dirname "$0" )" && pwd )"

# Destroy previous containers
$DIR/rm.sh

# Create mailcatcher container
echo "Running mailcatcher container"
docker run -d -p 1080:1080 -p 1025:1025 --name express-mailcatcher alexisno/mailcatcher

# Run node.js container
echo "Running mailcatcher container"
docker run -d -p 3000:3000 -v $DIR/../src:/var/www/myapp --name express-nodejs express-nodejs-image

# Run node container
echo "Running nginx container"
docker run -d -p 80:80 --name express-nginx express-nginx-image
