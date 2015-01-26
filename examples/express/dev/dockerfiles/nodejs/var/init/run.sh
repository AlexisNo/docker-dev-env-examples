#!/bin/bash

PATH="~/.node/bin:$PATH"

# Install a sample app
if [ ! -e /var/www/myapp/app.js ]; then
    echo "Generate an Express.js application"
    cd /var/www/ && express myapp
    cd /var/www/myapp && npm install
else
    echo "Express.js is already installed"
fi

cp /var/init/.foreverignore /var/www/myapp/.foreverignore
mkdir /var/www/myapp/log
cd /var/www/myapp
forever -w -o log/out.log -e log/err.log ./bin/www
