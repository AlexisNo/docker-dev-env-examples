#!/bin/bash

# Retrieve current directory
DIR="$( cd "$( dirname "$0" )" && pwd )"

# Install magento
if [ ! -d /var/www/magento/app ]; then
    echo "Install Magento"
    cd /var/www/magento
    n98-magerun.phar install --dbHost="db"\
                             --dbUser="root"\
                             --dbPass=""\
                             --dbName="magentodb"\
                             --installSampleData=no\
                             --useDefaultConfigParams=yes\
                             --magentoVersionByName="magento-ce-1.9.0.1"\
                             --installationFolder="."\
                             --baseUrl=$ADMIN_ADDRESS
    cp /var/init/local.xml /var/www/magento/app/etc/local.xml
    chown www-data:www-data /var/www/magento/* -R

    n98-magerun.phar config:set --scope="default" --scope-id=0 web/secure/use_in_adminhtml 1
    n98-magerun.phar config:set --scope=websites --scope-id=1 web/unsecure/base_url http://$STORE_ADDRESS/
    n98-magerun.phar config:set --scope=websites --scope-id=1 web/secure/base_url https://$STORE_ADDRESS/
else
    echo "Magento is already installed"
fi
