MailCatcher docker image for development environment
====================================================

## Configuration

Basic usage:
```
docker run -d -p 1080:1080 alexisno/mailcatcher-dev
```
* `docker run ... alexisno/mailcatcher-dev` Run `MailCatcher` in a new container
* `-d` Detached mode: Run container in the background
* `-p 1080:1080` Publish the container's port 1080 on the host to see the e-mails

Watch the catched e-mails at http://localhost:1080

Use it linked to a [`alexisno/apache-php-dev`](https://github.com/AlexisNo/dev-dockerfiles/tree/master/ubuntu/children/apache-php) or a [`alexisno/nginx-php-dev`](https://github.com/AlexisNo/dev-dockerfiles/tree/master/ubuntu/children/nginx/children/nginx-php) container.
