FROM alexisno/nginx-php

ENV STORE_ADDRESS=www.magento.local
ENV ADMIN_ADDRESS=admin.magento.local

# Install the php packages to run Magento
RUN apt-get update && apt-get install -y php5-dev php5-curl php5-mcrypt php5-gd php5-mysql php5-memcached

# Enable Mcrypt
RUN php5enmod mcrypt

# Save sessions in memcached
RUN sed -i -e "s/^session.save_handler = files/session.save_handler = memcached/" /etc/php5/fpm/php.ini
RUN sed -i -e "s/^;     session.save_path = \"N;\/path\"/session.save_path = \"memcached:11211\"/" /etc/php5/fpm/php.ini

# Install self signed certificates for admin and front
RUN /gencert.sh $STORE_ADDRESS
RUN /gencert.sh $ADMIN_ADDRESS

# Add and enable virtualhost
COPY /etc/nginx/sites-available/magento.conf /etc/nginx/sites-available/magento.conf
RUN sed -i -e "s/{{STORE_ADDRESS}}/$STORE_ADDRESS/" /etc/nginx/sites-available/magento.conf
RUN sed -i -e "s/{{ADMIN_ADDRESS}}/$ADMIN_ADDRESS/" /etc/nginx/sites-available/magento.conf
RUN ln -s /etc/nginx/sites-available/magento.conf /etc/nginx/sites-enabled/magento.conf

# Install magerun command line
RUN wget https://raw.githubusercontent.com/netz98/n98-magerun/master/n98-magerun.phar
RUN mv n98-magerun.phar /usr/local/bin/n98-magerun.phar
RUN chmod +x /usr/local/bin/n98-magerun.phar
COPY /etc/n98-magerun.yaml /etc/n98-magerun.yaml

# Install Magento if sources don't exist
COPY /etc/my_init.d/20_install-magento.sh /etc/my_init.d/20_install-magento.sh
COPY /var/init/local.xml /var/init/local.xml
RUN chmod +x /etc/my_init.d/20_install-magento.sh


# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
