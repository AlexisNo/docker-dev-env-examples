#!/bin/bash

# Retrieve current directory
DIR="$( cd "$( dirname "$0" )" && pwd )"

# Install a sample app
if [ ! -e /var/www/myapp/app.js ]; then
    echo "Generate an Express.js application"
    cd /var/www/ && express myapp
    cd /var/www/myapp && npm install
else
    echo "Express.js is already installed"
fi

sudo -H -u node `cd /var/www/myapp && DEBUG=myapp ./bin/www > /var/www/myapp/run-app.log`
