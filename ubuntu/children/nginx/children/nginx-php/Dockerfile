# Pull base image
FROM alexisno/nginx-dev

# Install basic packages
RUN apt-get update &&\
    apt-get -y install php5-fpm php5-cli php5-xdebug php5-xsl build-essential ruby1.9.1-dev libsqlite3-dev &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Replace Nginx default page by phpinfo
RUN mkdir -p /var/www/html/ && echo "<?php echo phpinfo();" >> /var/www/html/index.php

# Setup PHP timezone
RUN echo date.timezone=Europe/Paris >> /etc/php5/fpm/conf.d/01-timezone.ini

# Setup PHP to use the alexisno/mailcatcher-dev image to send mails
# The name of the linked container must be "mailcatcher"
# Display all errors
# Configure Xdebug
RUN gem install mailcatcher --no-rdoc --no-ri &&\
    sed -i -e "s/.*sendmail_path =.*/sendmail_path = \/usr\/bin\/env \/usr\/local\/bin\/catchmail --smtp-ip mailcatcher -f address@example\.com/" /etc/php5/fpm/php.ini &&\
    sed -i -e "s/.*sendmail_path =.*/sendmail_path = \/usr\/bin\/env catchmail --smtp-ip mailcatcher -f address@example\.com/" /etc/php5/cli/php.ini &&\
    echo "error_reporting = E_ALL\ndisplay_startup_errors = 1\ndisplay_errors = 1" >> /etc/php5/fpm/conf.d/01-errors.ini &&\
    echo "error_reporting = E_ALL\ndisplay_startup_errors = 1\ndisplay_errors = 1" >> /etc/php5/cli/conf.d/01-errors.ini &&\
    echo "xdebug.remote_enable=1" >> /etc/php5/fpm/conf.d/20-xdebug.ini &&\
    echo "xdebug.remote_connect_back=1" >> /etc/php5/fpm/conf.d/20-xdebug.ini &&\
    echo "xdebug.profiler_enable_trigger=1" >> /etc/php5/fpm/conf.d/20-xdebug.ini &&\
    echo "xdebug.max_nesting_level=250" >> /etc/php5/fpm/conf.d/20-xdebug.ini

# Install Composer
RUN cd $HOME &&\
    curl -sS https://getcomposer.org/installer | php &&\
    chmod +x composer.phar &&\
    mv composer.phar /usr/local/bin/composer

# Install phing, PHPUnit and PHPDocx with user "dev"
USER dev
RUN composer global require "phing/phing=2.*" &&\
    composer global require "phpunit/phpunit=*" &&\
    composer global require 'theseer/phpdox=@stable'
ENV PATH $PATH:$COMPOSER_HOME/vendor/bin/
USER root

# Create default virtualhosts
COPY /etc/nginx/sites-available/phpinfo.conf /etc/nginx/sites-available/phpinfo.conf
RUN ln -s /etc/nginx/sites-available/phpinfo.conf /etc/nginx/sites-enabled/phpinfo.conf &&\
    rm /etc/nginx/sites-enabled/default &&\
    rm /etc/nginx/sites-enabled/default-ssl

# Create the default command for the container
COPY /usr/local/bin/start-service /usr/local/bin/start-service
RUN chmod +x /usr/local/bin/start-service

# We want the default user to be "dev"
# Meanwhile php5-fpm and nginx must be launch with sudo
USER dev
CMD ["start-service"]
