# Pull base image
FROM alexisno/ubuntu-base

# Install memcached
RUN apt-get update && apt-get -y install memcached

# Allow to access memcached from outside
RUN sed -i 's/^-l 127.0.0.1/-l 0.0.0.0/' /etc/memcached.conf

# Start memcached sever
COPY /etc/my_init.d/10_start-memcached.sh /etc/my_init.d/10_start-memcached.sh
RUN chmod +x /etc/my_init.d/10_start-memcached.sh

EXPOSE 11211
