# Pull base image
FROM alexisno/python-dev

USER root

# Uncomment the following lines and enter the host user UID if necessary
#RUN change-dev-id 1002

# Install Django
RUN pip install Django && mkdir -p /var/www && chown dev:dev /var/www

# Create a command to generate a sample app
# and the default command to start the container
COPY /usr/local/bin/generate-app /usr/local/bin/generate-app
COPY /usr/local/bin/start-service /usr/local/bin/start-service
RUN chmod +x /usr/local/bin/generate-app /usr/local/bin/start-service

USER dev

WORKDIR /var/www

EXPOSE 8000

CMD ["start-service"]
