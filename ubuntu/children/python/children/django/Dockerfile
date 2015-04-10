# Pull base image
FROM alexisno/python-dev

# Install Django
RUN pip install Django && mkdir -p /var/www

WORKDIR /var/www

# Create the default command for the container
COPY /usr/local/bin/start-service /usr/local/bin/start-service
RUN chmod +x /usr/local/bin/start-service

USER dev

EXPOSE 8000

CMD ["start-service"]
