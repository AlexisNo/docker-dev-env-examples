# Pull base image
FROM alexisno/ubuntu-base

# Install memcached
RUN apt-get update &&\
    apt-get -y install memcached &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Allow to access memcached from outside
RUN sed -i 's/^-l 127.0.0.1/-l 0.0.0.0/' /etc/memcached.conf

EXPOSE 11211

CMD ["memcached", "-u", "memcache"]
