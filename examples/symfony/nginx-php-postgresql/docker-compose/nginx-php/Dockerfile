FROM alexisno/nginx-php-dev

# Uncomment the following lines and enter the host user UID if necessary
RUN change-dev-id 1002

ENV SYMFONY_ADDRESS=symfony.local

# Install pdo-mysql
RUN apt-get update && apt-get install -y php5-intl php5-mysql

# Install self signed certificates
RUN gencert $SYMFONY_ADDRESS

# Add and activate virtualhost
COPY /etc/nginx/sites-available/symfony.conf /etc/nginx/sites-available/symfony.conf
RUN sed -i -e "s/{{SYMFONY_ADDRESS}}/$SYMFONY_ADDRESS/" /etc/nginx/sites-available/symfony.conf
RUN ln -s /etc/nginx/sites-available/symfony.conf /etc/nginx/sites-enabled/symfony.conf

# Install Symfony if sources do not exist
COPY /etc/my_init.d/20_install-symfony.sh /etc/my_init.d/20_install-symfony.sh
COPY /var/init/parameters.yml /var/init/parameters.yml
RUN chmod +x /etc/my_init.d/20_install-symfony.sh
