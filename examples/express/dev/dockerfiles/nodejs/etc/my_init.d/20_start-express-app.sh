#!/bin/bash

cd /var/www/myapp && DEBUG=myapp ./bin/www > /var/www/myapp/run-app.log
