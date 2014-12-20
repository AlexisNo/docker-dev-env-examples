# Pull base image.
FROM alexisno/ubuntu-base

# Install basic packages
RUN apt-get update && apt-get -y install nginx

# Add script to generate self signed certificates
# Script from https://gist.github.com/bradland/1690807
COPY /gencert.sh /gencert.sh
RUN chmod +x /gencert.sh

# Enable SSL and setup a testing SSL virtualhost
RUN /gencert.sh localhost
COPY /etc/nginx/sites-available/default-ssl /etc/nginx/sites-available/default-ssl
RUN ln -s /etc/nginx/sites-available/default-ssl /etc/nginx/sites-enabled/default-ssl

# Start Nginx
COPY /etc/my_init.d/10_start-nginx.sh /etc/my_init.d/10_start-nginx.sh
RUN chmod +x /etc/my_init.d/10_start-nginx.sh

# Expose http port
EXPOSE 80 443


# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
