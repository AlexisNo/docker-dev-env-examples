#!/bin/bash

# Retrieve current directory
DIR="$( cd "$( dirname "$0" )" && pwd )"

# Install symfony
if [ ! -d /var/www/symfony/web ]; then
    echo "Install Symfony"
    wget -O symfony.tgz http://symfony.com/download\?v\=Symfony_Standard_Vendors_2.3.23.tgz
    tar zxvf symfony.tgz
    mv Symfony/* /var/www/symfony
    cp /var/init/parameters.yml /var/www/symfony/app/config/parameters.yml
    chown -R www-data:www-data /var/www/symfony/*

    HOST_IP=`/sbin/ip route|awk '/default/ { print $3 }'`
    sed -i -e "s/'127.0.0.1'/'127.0.0.1', '$HOST_IP'/" /var/www/symfony/web/app_dev.php
    sed -i -e "s/'127.0.0.1'/'127.0.0.1', '$HOST_IP'/" /var/www/symfony/web/config.php
else
    echo "Symfony is already installed"
fi
