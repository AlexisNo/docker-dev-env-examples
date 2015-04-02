# Pull base image.
FROM alexisno/ubuntu-dev

# Install basic packages.
RUN add-apt-repository ppa:chris-lea/node.js &&\
    apt-get update &&\
    apt-get -y install python-software-properties python g++ make nodejs &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install npm packages globally with user dev
USER dev
RUN echo "prefix = ~/.node" >> ~/.npmrc &&\
    echo "export PATH='/home/dev/.node/bin:$PATH'" >> ~/.bashrc &&\
    echo "export PATH='/home/dev/.node/bin:$PATH'" >> ~/.zshrc &&\
    npm install -g forever bower grunt-cli node-inspector

WORKDIR /var/www
