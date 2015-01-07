# Pull base image
FROM alexisno/ubuntu-base

# Install basic packages
RUN apt-get update && apt-get -y install apache2 php5 php5-cli php5-xdebug php5-xsl build-essential ruby1.9.1-dev libsqlite3-dev

# Replace Apache default page by phpinfo
RUN echo "<?php echo phpinfo();" >> /var/www/html/index.php && rm /var/www/html/index.html
RUN chown -R dev:dev /var/www

# Setup PHP timezone
RUN echo date.timezone=Europe/Paris >> /etc/php5/apache2/conf.d/01-timezone.ini

# Setup PHP to use the alexisno/mailcatcher image to send mails
# The name of the linked container must be "mailcatcher"
RUN gem install mailcatcher --no-rdoc --no-ri
RUN sed -i -e "s/.*sendmail_path =.*/sendmail_path = \/usr\/bin\/env catchmail --smtp-ip mailcatcher -f address@example\.com/" /etc/php5/apache2/php.ini
RUN sed -i -e "s/.*sendmail_path =.*/sendmail_path = \/usr\/bin\/env catchmail --smtp-ip mailcatcher -f address@example\.com/" /etc/php5/cli/php.ini

# Display all errors
RUN echo "error_reporting = E_ALL\ndisplay_startup_errors = 1\ndisplay_errors = 1" >> /etc/php5/apache2/conf.d/01-errors.ini
RUN echo "error_reporting = E_ALL\ndisplay_startup_errors = 1\ndisplay_errors = 1" >> /etc/php5/cli/conf.d/01-errors.ini

# Configure Xdebug
RUN echo "xdebug.remote_enable=1" >> /etc/php5/apache2/conf.d/20-xdebug.ini
RUN echo "xdebug.remote_connect_back=1" >> /etc/php5/apache2/conf.d/20-xdebug.ini
RUN echo "xdebug.profiler_enable_trigger=1" >> /etc/php5/apache2/conf.d/20-xdebug.ini
RUN echo "xdebug.max_nesting_level=250" >> /etc/php5/apache2/conf.d/20-xdebug.ini

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN chmod +x composer.phar
RUN mv composer.phar /usr/local/bin/composer

# Install phing, PHPUnit and PHPDocx
ENV COMPOSER_HOME /opt/composer
RUN composer global require "phing/phing=2.*"
RUN composer global require "phpunit/phpunit=*"
RUN composer global require 'theseer/phpdox=@stable'
ENV PATH $PATH:/opt/composer/vendor/bin/

# Add script to generate self signed certificates
# Script from https://gist.github.com/bradland/1690807
COPY /gencert.sh /gencert.sh
RUN chmod +x /gencert.sh

# Enable SSL and setup a testing SSL virtualhost
RUN a2enmod ssl
RUN /gencert.sh localhost
COPY /etc/apache2/sites-available/000-default-ssl.conf /etc/apache2/sites-available/000-default-ssl.conf
RUN a2ensite 000-default-ssl

# Start Apache
COPY /etc/my_init.d/10_start-apache2.sh /etc/my_init.d/10_start-apache2.sh
RUN chmod +x /etc/my_init.d/10_start-apache2.sh

# Expose http and https ports
EXPOSE 80 443


# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
