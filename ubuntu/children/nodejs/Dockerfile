# Pull base image.
FROM alexisno/ubuntu-dev

# Install basic packages.
RUN add-apt-repository ppa:chris-lea/node.js &&\
    apt-get update &&\
    apt-get -y install python-software-properties python g++ make nodejs &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set ownership on /var/www
RUN mkdir -p /var/www && chown dev:dev /var/www

# Install npm packages globally with user dev
USER dev
RUN echo "prefix = ~/.node" >> ~/.npmrc &&\
    npm install -g forever bower grunt-cli node-inspector
ENV PATH $PATH:/home/dev/.node/bin/

WORKDIR /var/www

CMD ["node"]
