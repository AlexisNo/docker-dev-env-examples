FROM alexisno/nodejs

# Install sails globally
USER node
ENV HOME /home/node/
RUN npm install -g sails
USER root
ENV HOME /root/

# Init scripts
COPY /etc/my_init.d/10_install-sails-app.sh /etc/my_init.d/10_install-sails-app.sh
COPY /etc/my_init.d/20_start-sails-app.sh /etc/my_init.d/20_start-sails-app.sh
RUN chmod +x /etc/my_init.d/10_install-sails-app.sh /etc/my_init.d/20_start-sails-app.sh

# Expose sails.js default port
EXPOSE 1337
