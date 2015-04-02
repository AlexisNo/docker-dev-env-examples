FROM alexisno/apache-php-dev

# Uncomment the following lines and enter the host user UID if necessary
RUN change-dev-id 1002

ENV SYMFONY_ADDRESS=symfony.local

# Install pdo-mysql
RUN apt-get update && apt-get install -y php5-intl php5-mysql

# Activate mod-rewrite
RUN a2enmod rewrite

# Install self signed certificates
RUN gencert $SYMFONY_ADDRESS

# Install symfony installer
RUN curl -LsS http://symfony.com/installer > symfony.phar
RUN sudo mv symfony.phar /usr/local/bin/symfony
RUN chmod a+x /usr/local/bin/symfony

# Add and activate virtualhost
COPY /etc/apache2/sites-available/symfony.conf /etc/apache2/sites-available/symfony.conf
RUN sed -i -e "s/{{SYMFONY_ADDRESS}}/$SYMFONY_ADDRESS/" /etc/apache2/sites-available/symfony.conf
RUN a2ensite symfony

# Install symfony command line
RUN curl -LsS http://symfony.com/installer > symfony.phar && \
    mv symfony.phar /usr/local/bin/symfony && \
    chmod a+x /usr/local/bin/symfony

# Create the default command for the container
COPY /usr/bin/start-service /usr/bin/start-service
RUN chmod +x /usr/bin/start-service

USER dev

# Copy useful resources for the default command
COPY /home/dev/resources/parameters.yml /home/dev/resources/parameters.yml

CMD ["start-service"]
