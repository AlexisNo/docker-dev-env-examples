FROM alexisno/apache-php

ENV SYMFONY_ADDRESS=symfony.local

# Install pdo-mysql
RUN apt-get update && apt-get install -y php5-intl php5-mysql

# Activate mod-rewrite
RUN a2enmod rewrite

# Install self signed certificates
RUN /gencert.sh $SYMFONY_ADDRESS

# Add and activate virtualhost
COPY /etc/apache2/sites-available/symfony.conf /etc/apache2/sites-available/symfony.conf
RUN sed -i -e "s/{{SYMFONY_ADDRESS}}/$SYMFONY_ADDRESS/" /etc/apache2/sites-available/symfony.conf
RUN a2ensite symfony

# Install Symfony if sources do not exist
COPY /etc/my_init.d/20_install-symfony.sh /etc/my_init.d/20_install-symfony.sh
COPY /var/init/parameters.yml /var/init/parameters.yml
RUN chmod +x /etc/my_init.d/20_install-symfony.sh
