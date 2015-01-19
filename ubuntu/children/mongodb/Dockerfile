# Pull base image.
FROM alexisno/ubuntu-dev

# Install MongoDB
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 &&\
    echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/mongodb.list &&\
    apt-get update &&\
    apt-get install -y mongodb-org &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Modify MongoDB config to access it from outside the container
RUN sed -i 's/bind_ip = 127.0.0.1/bind_ip = 0.0.0.0/g' /etc/mongod.conf

# Define mountable directories.
VOLUME ["/var/lib/mongodb"]

# Expose MongoDB port
EXPOSE 27017

# Start MongoDB
CMD ["mongod", "--fork", "--logpath", "/var/log/mongodb.log"]
