MailCatcher docker image for development environment
====================================================

## Configuration

Basic usage:
```
docker run -d -p 1080:1080 alexisno/mailcatcher
```
* `docker run ... alexisno/mailcatcher` Run `MailCatcher` in a new container
* `-d` Detached mode: Run container in the background
* `-p 1080:1080` Publish the container's port 1080 on the host to see the e-mails

Watch the catched e-mails at http://localhost:1080

Use it linked to a [`alexisno/apache-php`](https://github.com/AlexisNo/dev-dockerfiles/tree/master/ubuntu-base/children/apache-php) or a [`alexisno/nginx-php`](https://github.com/AlexisNo/dev-dockerfiles/tree/master/ubuntu-base/children/nginx/children/nginx-php) container.
