FROM alexisno/nodejs-dev

# Uncomment the following lines and enter the host user UID if necessary
USER root
RUN change-dev-id 1001
USER dev

# Install sails globally
RUN npm install -g sails

# Copy useful resources for the default command
COPY /home/dev/resources/.foreverignore /home/dev/resources/.foreverignore

# Create the default command for the container
USER root
COPY /usr/local/bin/generate-app /usr/local/bin/generate-app
COPY /usr/local/bin/start-service /usr/local/bin/start-service
RUN chmod +x /usr/local/bin/generate-app /usr/local/bin/start-service
USER dev

# Expose sails.js default port
EXPOSE 1337

# Start sails app
CMD ["start-service"]
