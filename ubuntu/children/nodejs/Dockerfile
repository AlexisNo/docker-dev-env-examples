# Pull base image.
FROM alexisno/ubuntu-dev

# Install basic packages.
RUN add-apt-repository ppa:chris-lea/node.js &&\
    apt-get update &&\
    apt-get -y install python-software-properties python g++ make nodejs &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Create node user
RUN mkdir -p /var/log/forever && chown dev:dev /var/log/forever

# Install npm packages globally with user dev
USER dev
RUN echo "prefix = ~/.node" >> ~/.npmrc &&\
    echo "export PATH='$PATH:~/.node/bin'" >> ~/.bashrc &&\
    npm install -g forever bower grunt-cli node-inspector
