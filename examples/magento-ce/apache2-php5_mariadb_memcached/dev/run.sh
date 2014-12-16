#!/bin/bash

# Retrieve current directory
DIR="$( cd "$( dirname "$0" )" && pwd )"

# Destroy previous containers
$DIR/rm.sh

# Create cache server container
echo "Running memcached container"
docker run -d -p 11211:11211 --name magento-ce-memcached alexisno/memcached

# Create database container
echo "Running mariadb container"
mkdir -p $DIR/data/mysql
docker run -d -p 3306:3306 -v $DIR/data/mysql:/var/lib/mysql --name magento-ce-mariadb alexisno/mariadb

# Create webserver container
echo "Running apache2-php5 container"
docker run -d -p 80:80 -p 443:443\
           -v $DIR/../src:/var/www/magento-ce\
           -v $DIR/data/log/apache2:/var/log/apache2\
           --link magento-ce-memcached:memcached\
           --link magento-ce-mariadb:db\
           --name magento-ce-apache2-php5 magento-ce-apache2-php5-image


#docker run -it -p 80:80 -p 443:443\
#           -v `pwd`/../src:/var/www/magento-ce\
#           -v `pwd`/data/log/apache2:/var/log/apache2\
#           --link magento-ce-memcached:memcached\
#           --link magento-ce-mariadb:db\
#           --name magento-ce-apache2-php5 magento-ce-apache2-php5-image /bin/zsh
