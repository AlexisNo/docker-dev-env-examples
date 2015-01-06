# Pull base image.
FROM alexisno/ubuntu-base

# Install basic packages.
RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-get update && apt-get -y install python-software-properties python g++ make nodejs

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create node user
RUN useradd node -m -d /home/node/ -s /bin/bash
RUN mkdir -p /var/www && chown node:node /var/www
RUN mkdir -p /var/log/forever && chown node:node /var/log/forever

# Install npm packages globally with user node
USER node
ENV HOME /home/node/
RUN echo "prefix = ~/.node" >> ~/.npmrc &&\
    echo "export PATH='$PATH:~/.node/bin'" >> /home/node/.bashrc &&\
    npm install -g forever bower grunt-cli node-inspector

USER root
ENV HOME /root/
