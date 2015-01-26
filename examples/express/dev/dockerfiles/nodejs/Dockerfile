FROM alexisno/nodejs-dev

# Install express generator
RUN npm install -g express-generator

# Install sails sample application if no source exists
COPY /var/init/run.sh /var/init/run.sh
COPY /var/init/.foreverignore /var/init/.foreverignore

# Expose express generator default port
EXPOSE 3000

# Start express app
CMD ["bash", "/var/init/run.sh"]
