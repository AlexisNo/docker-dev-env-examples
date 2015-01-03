Node.js Dockerfile for dev environment
======================================

Image to run Node.js applications
---------------------------------

Globally installed npm packages:
 * forever
 * bower
 * grunt-cli
 * node-inspector

Basic usage:
```
docker run -d alexisno/nodejs
```
* `docker run ... alexisno/nodejs` create a new container based on the image
* `-d` Detached mode: Run container in the background

