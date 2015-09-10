# Pull base image.
FROM alexisno/ubuntu-dev

# Install basic packages.
RUN apt-get update && apt-get -y install python-software-properties python g++ make &&\
    apt-get clean && rm -rf /var/lib/apt/lists/* &&\
    cd /opt &&\
    wget https://nodejs.org/dist/v4.0.0/node-v4.0.0-linux-x64.tar.gz &&\
    tar xvzf node-v4.0.0-linux-x64.tar.gz &&\
    ln -s /opt/node-v4.0.0-linux-x64/bin/node /usr/local/bin/node &&\
    ln -s /opt/node-v4.0.0-linux-x64/bin/npm /usr/local/bin/npm

# Set ownership on /var/www
RUN mkdir -p /var/www && chown dev:dev /var/www

# Install npm packages globally with user dev
USER dev
RUN echo "prefix = ~/.node" >> ~/.npmrc &&\
    npm install -g node-gyp forever bower grunt-cli node-inspector longjohn debug
ENV PATH $PATH:/home/dev/.node/bin/

WORKDIR /var/www

CMD ["node"]
