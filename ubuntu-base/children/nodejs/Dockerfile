# Pull base image.
FROM alexisno/ubuntu-base

# Install basic packages.
RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-get update && apt-get -y install python-software-properties python g++ make nodejs

# Create node user and allow him to install npm packages globally
RUN useradd node -d /home/node/ -s /bin/bash &&\
    mkdir /home/node &&\
    echo "prefix = ~/.node" >> /home/node/.npmrc &&\
    export PATH="$PATH:$HOME/.node/bin" >> /home/node/.bashrc &&\
    chown -R node:node /home/node

# Install useful packages globally
RUN sudo -H -u node npm install -g forever bower grunt-cli node-inspector

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
