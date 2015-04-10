# Pull base image
FROM alexisno/ubuntu-dev

# Add the PostgreSQL PGP key to verify their Debian packages
# Add PostgreSQL's repository
# Install ``python-software-properties``, ``software-properties-common`` and PostgreSQL 9.3
RUN apt-get update &&\
    apt-get -y install python-software-properties software-properties-common postgresql-9.3 postgresql-client-9.3 postgresql-contrib-9.3 &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Run the rest of the commands as the ``postgres`` user created by the ``postgres-9.3`` package when it was ``apt-get installed``
USER postgres

# Create a PostgreSQL role named ``docker`` with ``docker`` as the password and
# then create a database `docker` owned by the ``docker`` role.
RUN cd /home &&\
    /etc/init.d/postgresql start &&\
    psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" &&\
    createdb --owner=docker --template=template0 --encoding=UTF8 docker

# Adjust PostgreSQL configuration so that remote connections to the database are possible.
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.3/main/pg_hba.conf &&\
    echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf

# Add VOLUMEs to allow backup of config, logs and databases
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

# Expose the PostgreSQL port
EXPOSE 5432

# Set the default command to run when starting the container
CMD ["/usr/lib/postgresql/9.3/bin/postgres", "-D", "/var/lib/postgresql/9.3/main", "-c", "config_file=/etc/postgresql/9.3/main/postgresql.conf"]
