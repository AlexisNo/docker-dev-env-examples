# Pull base image
FROM alexisno/nginx

# Install php-fpm, xdebug and postfix
RUN sudo apt-get update && apt-get -y install php5-fpm php5-cli php5-xdebug php5-xsl  build-essential ruby1.9.1-dev libsqlite3-dev

# Install mailcatcher
RUN gem install mailcatcher --no-rdoc --no-ri
RUN sed -i -e "s/.*sendmail_path =.*/sendmail_path = \/usr\/bin\/env \/usr\/local\/bin\/catchmail -f address@example\.com/" /etc/php5/fpm/php.ini
RUN sed -i -e "s/.*sendmail_path =.*/sendmail_path = \/usr\/bin\/env \/usr\/local\/bin\/catchmail -f address@example\.com/" /etc/php5/cli/php.ini

# Replace Nginx default page by phpinfo
RUN mkdir -p /var/www/html/
RUN echo "<?php echo phpinfo();" >> /var/www/html/index.php

# Create default virtualhosts
COPY /etc/nginx/sites-available/phpinfo.conf /etc/nginx/sites-available/phpinfo.conf
RUN ln -s /etc/nginx/sites-available/phpinfo.conf /etc/nginx/sites-enabled/phpinfo.conf
RUN rm /etc/nginx/sites-enabled/default
RUN rm /etc/nginx/sites-enabled/default-ssl

# Display all errors
RUN echo "error_reporting = E_ALL\ndisplay_startup_errors = 1\ndisplay_errors = 1" >> /etc/php5/fpm/conf.d/01-errors.ini
RUN echo "error_reporting = E_ALL\ndisplay_startup_errors = 1\ndisplay_errors = 1" >> /etc/php5/cli/conf.d/01-errors.ini

# Setup PHP timezone
RUN echo date.timezone=Europe/Paris >> /etc/php5/fpm/conf.d/01-timezone.ini

# Configure Xdebug
RUN echo "xdebug.remote_enable=1" >> /etc/php5/fpm/conf.d/20-xdebug.ini
RUN echo "xdebug.remote_connect_back=1" >> /etc/php5/fpm/conf.d/20-xdebug.ini
RUN echo "xdebug.profiler_enable_trigger=1" >> /etc/php5/fpm/conf.d/20-xdebug.ini
RUN echo "xdebug.max_nesting_level=250" >> /etc/php5/fpm/conf.d/20-xdebug.ini

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

# Start Mailcatcher and php-fpm
COPY /etc/my_init.d/03_mailcatcher.sh /etc/my_init.d/03_mailcatcher.sh
RUN chmod +x /etc/my_init.d/03_mailcatcher.sh
COPY /etc/my_init.d/06_start-php5-fpm.sh /etc/my_init.d/06_start-php5-fpm.sh
RUN chmod +x /etc/my_init.d/06_start-php5-fpm.sh
