#!/bin/bash

# Retrieve current directory
DIR="$( cd "$( dirname "$0" )" && pwd )"

# Destroy previous containers
$DIR/rm.sh

# Create cache server container
echo "Running memcached container"
docker run -d -p 11211:11211 --name magento-memcached alexisno/memcached

# Create database container
echo "Running mariadb container"
mkdir -p $DIR/data/mysql
docker run -d -p 3306:3306 -v $DIR/data/mysql:/var/lib/mysql --name magento-mariadb alexisno/mariadb

# Create webserver container
echo "Running nginx-php container"
docker run -d -p 80:80 -p 443:443 -p 1080:1080\
           -v $DIR/../src:/var/www/magento\
           -v $DIR/data/log/nginx:/var/log/nginx\
           --link magento-memcached:memcached\
           --link magento-mariadb:db\
           --name magento-nginx-php magento-nginx-php-image
