FROM alexisno/nodejs-dev

# Uncomment the following lines and enter the host user UID if necessary
#USER root
#RUN change-dev-id 1002
#USER dev

# Install express generator
RUN npm install -g express-generator

# Copy useful resources for the default command
COPY /home/dev/resources/.foreverignore /home/dev/resources/.foreverignore

# Create a command to generate a sample app
# and the default command to start the container
USER root
COPY /usr/local/bin/generate-app /usr/local/bin/generate-app
COPY /usr/local/bin/start-service /usr/local/bin/start-service
RUN chmod +x /usr/local/bin/generate-app /usr/local/bin/start-service
USER dev

# Expose express generator default port
EXPOSE 3000

# Start express app
CMD ["start-service"]
