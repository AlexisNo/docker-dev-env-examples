Mailcatcher Dockerfile for dev environment
==========================================

Mailcatcher server
------------------

### Configuration

Basic usage:
```
docker run -d -p 1080:1080 alexisno/mailcatcher
```
* `docker run ... alexisno/mailcatcher` Run `mailcatcher` in a new container
* `-d` Detached mode: Run container in the background
* `-p 1080:1080` Publish the container's port 1080 on the host to see the e-mails
