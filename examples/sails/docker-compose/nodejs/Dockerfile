FROM alexisno/nodejs-dev

# Uncomment the following lines and enter the host user UID if necessary
USER root
RUN change-dev-id 1002
USER dev

# Install sails globally
RUN npm install -g sails

# Copy useful resources for the default command
COPY /home/dev/resources/.foreverignore /home/dev/resources/.foreverignore

# Create the default command for the container
USER root
COPY /usr/bin/start-service /usr/bin/start-service
RUN chmod +x /usr/bin/start-service
USER dev

# Expose sails.js default port
EXPOSE 1337

# Start sails app
CMD ["start-service"]
