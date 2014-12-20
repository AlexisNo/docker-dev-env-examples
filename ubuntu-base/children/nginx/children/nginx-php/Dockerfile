# Pull base image
FROM alexisno/nginx

# Prepare postfix configuration
RUN echo "postfix postfix/main_mailer_type select Internet Site" | debconf-set-selections
RUN echo "postfix postfix/mailname string mailname" | debconf-set-selections

# Install php-fpm, xdebug and postfix
RUN sudo apt-get update && apt-get -y install php5-fpm php5-cli php5-xdebug php5-xsl postfix

# Replace Nginx default page by phpinfo
RUN mkdir -p /var/www/html/
RUN echo "<?php echo phpinfo();" >> /var/www/html/index.php
COPY /etc/nginx/sites-available/phpinfo.conf /etc/nginx/sites-available/phpinfo.conf
RUN ln -s /etc/nginx/sites-available/phpinfo.conf /etc/nginx/sites-enabled/phpinfo.conf
RUN rm /etc/nginx/sites-enabled/default
RUN rm /etc/nginx/sites-enabled/default-ssl

# Configure Xdebug
RUN echo "xdebug.remote_enable=1" >> /etc/php5/fpm/conf.d/20-xdebug.ini
RUN echo "xdebug.remote_connect_back=1" >> /etc/php5/fpm/conf.d/20-xdebug.ini
RUN echo "xdebug.profiler_enable_trigger=1" >> /etc/php5/fpm/conf.d/20-xdebug.ini

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

# Start Postfix and php-fpm
COPY /etc/my_init.d/03_start-postfix.sh /etc/my_init.d/03_start-postfix.sh
RUN chmod +x /etc/my_init.d/03_start-postfix.sh
COPY /etc/my_init.d/06_start-php5-fpm.sh /etc/my_init.d/06_start-php5-fpm.sh
RUN chmod +x /etc/my_init.d/06_start-php5-fpm.sh
