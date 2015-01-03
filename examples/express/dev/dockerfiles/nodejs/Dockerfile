FROM alexisno/nodejs

# Install express generator
RUN npm install express-generator -g

# Start express application
COPY /etc/my_init.d/10_install-express-app.sh /etc/my_init.d/10_install-express-app.sh
COPY /etc/my_init.d/20_start-express-app.sh /etc/my_init.d/20_start-express-app.sh
RUN chmod +x /etc/my_init.d/10_install-express-app.sh /etc/my_init.d/20_start-express-app.sh

# Expose express generator default port
EXPOSE 3000


# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
