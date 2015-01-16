#!/bin/bash

# Install magento
if [ ! -d /var/www/magento/app ]; then
    echo "Install Magento"
    service apache2 start

    cd /var/www/magento
    sudo -H -u dev n98-magerun.phar install --dbHost="db"\
                                            --dbUser="root"\
                                            --dbPass=""\
                                            --dbName="magento"\
                                            --installSampleData=no\
                                            --useDefaultConfigParams=yes\
                                            --magentoVersionByName="magento-ce-1.9.0.1"\
                                            --installationFolder="."\
                                            --baseUrl=$ADMIN_ADDRESS
    sudo -H -u dev cp /var/init/local.xml /var/www/magento/app/etc/local.xml
    chmod -R 777 /var/www/magento/media /var/www/magento/var

    sudo -H -u dev n98-magerun.phar config:set --scope="default" --scope-id=0 web/secure/use_in_adminhtml 1
    sudo -H -u dev n98-magerun.phar config:set --scope=websites --scope-id=1 web/unsecure/base_url http://$STORE_ADDRESS/
    sudo -H -u dev n98-magerun.phar config:set --scope=websites --scope-id=1 web/secure/base_url https://$STORE_ADDRESS/

    service apache2 stop
else
    echo "Magento is already installed"
fi

/usr/sbin/apache2 -DFOREGROUND
