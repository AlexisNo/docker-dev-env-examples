FROM alexisno/apache-php-dev

# Uncomment the following lines and enter the host user UID if necessary
#RUN change-dev-id 1002

ENV SYMFONY_ADDRESS=symfony.local

# Install pdo-mysql
# Activate mod-rewrite
# Install self signed certificates
# Install symfony installer
RUN apt-get update && apt-get install -y php5-intl php5-mysql &&\
    a2enmod rewrite &&\
    gencert $SYMFONY_ADDRESS &&\
    curl -LsS http://symfony.com/installer > symfony.phar &&\
    sudo mv symfony.phar /usr/local/bin/symfony &&\
    chmod a+x /usr/local/bin/symfony

# Add and activate virtualhost
COPY /etc/apache2/sites-available/symfony.conf /etc/apache2/sites-available/symfony.conf
RUN sed -i -e "s/{{SYMFONY_ADDRESS}}/$SYMFONY_ADDRESS/" /etc/apache2/sites-available/symfony.conf &&\
    a2ensite symfony

# Install symfony command line
RUN curl -LsS http://symfony.com/installer > symfony.phar && \
    mv symfony.phar /usr/local/bin/symfony && \
    chmod a+x /usr/local/bin/symfony

# Create a command to generate a sample app
# and the default command to start the container
COPY /usr/local/bin/generate-app /usr/local/bin/generate-app
COPY /usr/local/bin/start-service /usr/local/bin/start-service
RUN chmod +x /usr/local/bin/generate-app  /usr/local/bin/start-service

USER dev

# Copy useful resources for the default command
COPY /home/dev/resources/parameters.yml /home/dev/resources/parameters.yml

CMD ["start-service"]
