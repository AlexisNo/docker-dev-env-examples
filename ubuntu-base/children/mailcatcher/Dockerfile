# Pull base image
FROM alexisno/ubuntu-base

# Install dependencies
RUN apt-get update && apt-get -y install build-essential ruby1.9.1-dev libsqlite3-dev

# Install mailcatcher
RUN gem install mailcatcher --no-rdoc --no-ri

# Start Mailcatcher
COPY /etc/my_init.d/10_start-mailcatcher.sh /etc/my_init.d/10_start-mailcatcher.sh
RUN chmod +x /etc/my_init.d/10_start-mailcatcher.sh

# Expose mailcatcher http port
EXPOSE 1025 1080

# Clean up APT when done
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
