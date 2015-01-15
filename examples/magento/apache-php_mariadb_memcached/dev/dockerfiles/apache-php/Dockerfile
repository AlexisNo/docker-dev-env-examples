FROM alexisno/apache-php

ENV STORE_ADDRESS=www.magento.local
ENV ADMIN_ADDRESS=admin.magento.local

# Install the php packages to run Magento
RUN apt-get update &&\
    apt-get install -y php5-dev php5-curl php5-mcrypt php5-gd php5-mysql php5-memcached &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Enable Mcrypt
# Save sessions in memcached
RUN php5enmod mcrypt &&\
    sed -i -e "s/^session.save_handler = files/session.save_handler = memcached/" /etc/php5/apache2/php.ini &&\
    sed -i -e "s/^;     session.save_path = \"N;\/path\"/session.save_path = \"memcached:11211\"/" /etc/php5/apache2/php.ini

# Install self signed certificates for admin and front
RUN /gencert.sh $STORE_ADDRESS && /gencert.sh $ADMIN_ADDRESS

# Add and enable virtualhost
# Enable rewrite mod
COPY /etc/apache2/sites-available/magento.conf /etc/apache2/sites-available/magento.conf
RUN sed -i -e "s/{{STORE_ADDRESS}}/$STORE_ADDRESS/" /etc/apache2/sites-available/magento.conf &&\
    sed -i -e "s/{{ADMIN_ADDRESS}}/$ADMIN_ADDRESS/" /etc/apache2/sites-available/magento.conf &&\
    a2ensite magento &&\
    a2enmod rewrite

# Install magerun command line
RUN wget https://raw.githubusercontent.com/netz98/n98-magerun/master/n98-magerun.phar &&\
    mv n98-magerun.phar /usr/local/bin/n98-magerun.phar &&\
    chmod +x /usr/local/bin/n98-magerun.phar
COPY /etc/n98-magerun.yaml /etc/n98-magerun.yaml

# The run script install Magento if sources do not exist
COPY /var/init/run.sh /var/init/run.sh
COPY /var/init/local.xml /var/init/local.xml
RUN chmod +x /var/init/run.sh

CMD ["bash", "/var/init/run.sh"]
