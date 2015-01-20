FROM alexisno/nodejs-dev

# Install sails globally
RUN npm install -g sails

# Install sails sample application if no source exists
COPY /var/init/run.sh /var/init/run.sh
COPY /var/init/.foreverignore /var/init/.foreverignore

# Expose sails.js default port
EXPOSE 1337

# Start sails app
CMD ["bash", "/var/init/run.sh"]
