#!/bin/bash

# Retrieve current directory
DIR="$( cd "$( dirname "$0" )" && pwd )"

# Install magento
if [ ! -e /var/www/my-sails-app/app.js ]; then
    echo "Generate a Sails.js application"
    chown -R node:node /var/www
    sudo -H -u node sh -c 'PATH=$PATH:~/.node/bin &&
    cd /var/www &&
    sails new my-sails-app &&
    cd /var/www/my-sails-app &&
    sails generate api demo'
    sed -i "s/\/\/ migrate: 'alter'/migrate:'alter'/g" /var/www/my-sails-app/config/models.js
else
    echo "An app is already installed"
fi
