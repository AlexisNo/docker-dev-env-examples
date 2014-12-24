#!/bin/bash

# Retrieve current directory
DIR="$( cd "$( dirname "$0" )" && pwd )"

echo "Install !!!" >> /out.log

# Install magento
if [ ! -d /var/www/magento-ce/app ]; then
    echo "Install Magento"
    cd /var/www/magento-ce
    n98-magerun.phar install --dbHost="db"\
                             --dbUser="root"\
                             --dbPass=""\
                             --dbName="magentodb"\
                             --installSampleData=no\
                             --useDefaultConfigParams=yes\
                             --magentoVersionByName="magento-ce-1.9.0.1"\
                             --installationFolder="."\
                             --baseUrl="http://admin.magento-ce.local/"
    cp /var/init/local.xml /var/www/magento-ce/app/etc/local.xml
    chown www-data:www-data /var/www/magento-ce -R

    n98-magerun.phar config:set --scope="default" --scope-id=0 web/secure/use_in_adminhtml 1
    n98-magerun.phar config:set --scope=websites --scope-id=1 web/unsecure/base_url http://www.magento-ce.local/
    n98-magerun.phar config:set --scope=websites --scope-id=1 web/secure/base_url https://www.magento-ce.local/
else
    echo "Magento is already installed"
fi
