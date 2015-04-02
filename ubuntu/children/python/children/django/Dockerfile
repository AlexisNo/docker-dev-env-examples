# Pull base image
FROM alexisno/python-dev

# Install Django
RUN pip install Django && mkdir -p /var/www

WORKDIR /var/www

# Create the default command for the container
COPY /usr/bin/start-service /usr/bin/start-service
RUN chmod +x /usr/bin/start-service

USER dev

EXPOSE 8000

CMD ["start-service"]
