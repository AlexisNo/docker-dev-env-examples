#!/bin/bash

# Install symfony
if [ ! -d /var/www/symfony/web ]; then
    # Install symfony rest edition
    sudo -H -u dev composer create-project symfony/framework-standard-edition /var/www/symfony
    sudo -H -u dev cp /var/init/parameters.yml /var/www/symfony/app/config/parameters.yml

    # Allow access to app_dev.php and config.php from host
    HOST_IP=`/sbin/ip route|awk '/default/ { print $3 }'`
    sed -i -e "s/'127.0.0.1'/'127.0.0.1', '$HOST_IP'/" /var/www/symfony/web/app_dev.php
    sed -i -e "s/'127.0.0.1'/'127.0.0.1', '$HOST_IP'/" /var/www/symfony/web/config.php

    # Allow writting in cache an log directories
    sudo chmod -R 777 /var/www/symfony/app/cache
    sudo chmod -R 777 /var/www/symfony/app/logs

    # Create database
    cd /var/www/symfony
    sudo -H -u dev php app/console doctrine:database:create --connection=default
else
    echo "Symfony is already installed"
fi

/usr/sbin/apache2 -DFOREGROUND
