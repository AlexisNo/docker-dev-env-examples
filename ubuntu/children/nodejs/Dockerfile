# Pull base image.
FROM alexisno/ubuntu-base

# Install basic packages.
RUN add-apt-repository ppa:chris-lea/node.js &&\
    apt-get update &&\
    apt-get -y install python-software-properties python g++ make nodejs &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Create node user
RUN useradd node -m -d /home/node/ -s /bin/bash &&\
    mkdir -p /var/www && chown node:node /var/www &&\
    mkdir -p /var/log/forever && chown node:node /var/log/forever

# Install npm packages globally with user node
USER node
RUN echo "prefix = ~/.node" >> ~/.npmrc &&\
    echo "export PATH='$PATH:~/.node/bin'" >> /home/node/.bashrc &&\
    npm install -g forever bower grunt-cli node-inspector
