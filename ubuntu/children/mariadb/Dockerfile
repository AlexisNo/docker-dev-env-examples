# Pull base image
FROM alexisno/ubuntu-dev

# Install mariadb server
RUN apt-get update &&\
    apt-get -y install mariadb-server &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Modify mariadb config to access it from outside the container
RUN sed -i 's/^\(bind-address\s.*\)/# \1/' /etc/mysql/my.cnf

# Allow root user to connect from anywhere
RUN service mysql start &&\
    mysqladmin --silent --wait=30 ping &&\
    mysql -e 'GRANT ALL PRIVILEGES ON *.* TO "root"@"%" WITH GRANT OPTION;'

# Add run.sh allow to rebuild a database if /var/lib/mysql is empty
# Useful when using a volume with "docker run -v /path/on/host:/var/lib/mysql"
COPY /var/init/run.sh /var/init/run.sh
RUN chmod +x /var/init/run.sh

# Define mountable directories
VOLUME ["/var/lib/mysql"]

# Expose mysql port
EXPOSE 3306

CMD ["bash", "/var/init/run.sh"]
