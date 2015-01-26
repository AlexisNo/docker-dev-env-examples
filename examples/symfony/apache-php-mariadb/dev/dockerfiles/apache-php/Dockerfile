FROM alexisno/apache-php-dev

ENV SYMFONY_ADDRESS=symfony.local

# Install pdo-mysql
RUN apt-get update && apt-get install -y php5-intl php5-mysql

# Activate mod-rewrite
RUN a2enmod rewrite

# Install self signed certificates
RUN /gencert.sh $SYMFONY_ADDRESS

# Install symfony installer
RUN curl -LsS http://symfony.com/installer > symfony.phar
RUN sudo mv symfony.phar /usr/local/bin/symfony
RUN chmod a+x /usr/local/bin/symfony

# Add and activate virtualhost
COPY /etc/apache2/sites-available/symfony.conf /etc/apache2/sites-available/symfony.conf
RUN sed -i -e "s/{{SYMFONY_ADDRESS}}/$SYMFONY_ADDRESS/" /etc/apache2/sites-available/symfony.conf
RUN a2ensite symfony

# Install Symfony if sources do not exist
COPY /var/init/run.sh /var/init/run.sh
COPY /var/init/parameters.yml /var/init/parameters.yml
RUN chmod +x /var/init/run.sh

CMD ["bash", "/var/init/run.sh"]
