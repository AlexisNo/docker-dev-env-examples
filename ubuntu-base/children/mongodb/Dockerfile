# Pull base image.
FROM alexisno/ubuntu-base

# Install MongoDB
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/mongodb.list
RUN apt-get update && apt-get install -y mongodb-org

# Modify MongoDB config to access it from outside the container
RUN sed -i 's/bind_ip = 127.0.0.1/bind_ip = 0.0.0.0/g' /etc/mongod.conf

# Start MongoDB
COPY /etc/my_init.d/10_start-mongodb.sh /etc/my_init.d/10_start-mongodb.sh
RUN chmod +x /etc/my_init.d/10_start-mongodb.sh

# Define mountable directories.
VOLUME ["/data/db"]

# Define working directory.
WORKDIR /data

# Expose MongoDB port
EXPOSE 27017


# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
