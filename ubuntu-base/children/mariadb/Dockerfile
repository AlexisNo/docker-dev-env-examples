# Pull base image
FROM alexisno/ubuntu-base

# Install mariadb server
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install mariadb-server

# Modify mariadb config to access it from outside the container
RUN sed -i 's/^\(bind-address\s.*\)/# \1/' /etc/mysql/my.cnf

# Allow root user to connect from anywhere
RUN service mysql start &&\
    mysqladmin --silent --wait=30 ping &&\
    mysql -e 'GRANT ALL PRIVILEGES ON *.* TO "root"@"%" WITH GRANT OPTION;'

# Add init-db.sh to allow to rebuild a database if /var/lib/mysql is empty
# Useful when using a volume with "docker run -v /path/on/host:/var/lib/mysql"
COPY /init-db.sh /init-db.sh
RUN chmod +x /init-db.sh

# Start mariadb sever
COPY /etc/my_init.d/10_start-mariadb.sh /etc/my_init.d/10_start-mariadb.sh
RUN chmod +x /etc/my_init.d/10_start-mariadb.sh

# Define mountable directories
VOLUME ["/var/lib/mysql"]

# Expose mysql port
EXPOSE 3306


# Clean up APT when done
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
