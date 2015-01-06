#!/bin/bash

# Retrieve current directory
DIR="$( cd "$( dirname "$0" )" && pwd )"

# Destroy previous containers
$DIR/rm.sh

# Create mailcatcher container
echo "Running mailcatcher container"
docker run -d -p 1080:1080 -p 1025:1025 --name symfony-mailcatcher alexisno/mailcatcher

# Create database container
echo "Running mariadb container"
mkdir -p $DIR/data/mysql
docker run -d -p 3306:3306 -v $DIR/data/mysql:/var/lib/mysql --name symfony-mariadb alexisno/mariadb

# Create webserver container
echo "Running apache-php container"
docker run -d -p 80:80 -p 443:443\
           -v $DIR/../src:/var/www/symfony\
           -v $DIR/data/log/apache2:/var/log/apache2\
           --link symfony-mailcatcher:mailcatcher\
           --link symfony-mariadb:db\
           --name symfony-apache-php symfony-apache-php-image