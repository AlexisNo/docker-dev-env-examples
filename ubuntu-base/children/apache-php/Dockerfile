# Pull base image
FROM alexisno/ubuntu-base

# Prepare postfix configuration
RUN echo "postfix postfix/main_mailer_type select Internet Site" | debconf-set-selections
RUN echo "postfix postfix/mailname string mailname" | debconf-set-selections

# Install basic packages
RUN apt-get update && apt-get -y install apache2 php5 php5-cli php5-xdebug php5-xsl postfix

# Replace Apache default page by phpinfo
RUN echo "<?php echo phpinfo();" >> /var/www/html/index.php && rm /var/www/html/index.html

# Configure Xdebug
RUN echo "xdebug.remote_enable=1" >> /etc/php5/apache2/conf.d/20-xdebug.ini
RUN echo "xdebug.remote_connect_back=1" >> /etc/php5/apache2/conf.d/20-xdebug.ini
RUN echo "xdebug.profiler_enable_trigger=1" >> /etc/php5/apache2/conf.d/20-xdebug.ini

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN chmod +x composer.phar
RUN mv composer.phar /usr/local/bin/composer

# Install phing PHPUnit PHPDocx
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

# Start Postfix and Apache
COPY /etc/my_init.d/10_start-postfix.sh /etc/my_init.d/10_start-postfix.sh
RUN chmod +x /etc/my_init.d/10_start-postfix.sh
COPY /etc/my_init.d/20_start-apache2.sh /etc/my_init.d/20_start-apache2.sh
RUN chmod +x /etc/my_init.d/20_start-apache2.sh

# Expose http and https ports
EXPOSE 80 443


# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
