FROM alexisno/apache-php-dev

# Uncomment the following lines and enter the host user UID if necessary
RUN change-dev-id 1002

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
RUN gencert $STORE_ADDRESS && gencert $ADMIN_ADDRESS

# Add and enable virtualhost and enable rewrite mod
COPY /etc/apache2/sites-available/magento.conf /etc/apache2/sites-available/magento.conf
RUN sed -i -e "s/{{STORE_ADDRESS}}/$STORE_ADDRESS/" /etc/apache2/sites-available/magento.conf &&\
    sed -i -e "s/{{ADMIN_ADDRESS}}/$ADMIN_ADDRESS/" /etc/apache2/sites-available/magento.conf &&\
    a2ensite magento && a2enmod rewrite

# Install magerun command line
RUN wget https://raw.githubusercontent.com/netz98/n98-magerun/master/n98-magerun.phar &&\
    mv n98-magerun.phar /usr/local/bin/n98-magerun &&\
    chmod +x /usr/local/bin/n98-magerun
COPY /etc/n98-magerun.yaml /etc/n98-magerun.yaml

# Create the default command for the container
COPY /usr/bin/start-service /usr/bin/start-service
RUN chmod +x /usr/bin/start-service

USER dev

# Copy useful resources for the default command
COPY /home/dev/resources/local.xml /home/dev/resources/local.xml

CMD ["start-service"]
