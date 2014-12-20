FROM alexisno/apache-php

# Install the php packages to run Magento
RUN apt-get update && apt-get install -y php5-dev php5-curl php5-mcrypt php5-gd php5-mysql php5-memcached

# Enable Mcrypt
RUN php5enmod mcrypt

# Enable rewrite mod
RUN a2enmod rewrite

# Install self signed certificates for admin and front
RUN /gencert.sh www.magento-ce.local
RUN /gencert.sh admin.magento-ce.local

# Add and enable virtualhost
COPY /etc/apache2/sites-available/magento-ce.conf /etc/apache2/sites-available/magento-ce.conf
RUN a2ensite magento-ce

# Save sessions in memcached
RUN sed -i -e "s/^session.save_handler = files/session.save_handler = memcached/" /etc/php5/apache2/php.ini
RUN sed -i -e "s/^;     session.save_path = \"N;\/path\"/session.save_path = \"memcached:11211\"/" /etc/php5/apache2/php.ini

# Install magerun command line
RUN wget https://raw.githubusercontent.com/netz98/n98-magerun/master/n98-magerun.phar
RUN mv n98-magerun.phar /usr/local/bin/n98-magerun.phar
RUN chmod +x /usr/local/bin/n98-magerun.phar
COPY /etc/n98-magerun.yaml /etc/n98-magerun.yaml

# Install Magento if sources don't exist
COPY /etc/my_init.d/30_install-magento.sh /etc/my_init.d/30_install-magento.sh
RUN chmod +x /etc/my_init.d/30_install-magento.sh
