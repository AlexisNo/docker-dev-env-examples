#!/bin/bash

chown node:node /var/log/forever
sudo -H -u node sh -c 'PATH=$PATH:~/.node/bin &&
                       cd /var/www/my-sails-app &&
                       FOREVER_ROOT=/var/log/forever forever start app.js'
