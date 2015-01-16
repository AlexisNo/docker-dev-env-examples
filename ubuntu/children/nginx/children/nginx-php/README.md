Nginx / PHP docker image for development environment
====================================================

## Configuration

Nginx, php5, Xdebug, composer, phpunit, phing

Nginx serve a phpinfo() page. To test it and obtain information about the configuration:
```
docker run -d -p 80:80 -p 443:443 alexisno/nginx-php
```
* `docker run ... alexisno/nginx-php` Run Nginx and PHP-FPM in a new container
* `-d` Detached mode: run container in the background
* `-p 80:80 -p 443:443` Publish the container's ports 80 and 443 on the host so you can connect to the server

Open your brower at http://localhost/ and https://localhost/

Composer, phpunit and phing are available globally.

PHP is configured to send mail via a [`alexisno/mailcatcher`](https://github.com/AlexisNo/dev-dockerfiles/tree/master/ubuntu/children/mailcatcher) container.
Launch a [`alexisno/mailcatcher`](https://github.com/AlexisNo/dev-dockerfiles/tree/master/ubuntu/children/mailcatcher) container and use `--link mailcatcher:my-mailcatcher-container`.

Xdebug is configurated to accept any connection. Just send the appropriate request parameters.


## Common usage

This image should be used as a basic image for any project.
* Create an apache virtualhost for the development environment.
* Create a Dockerfile with your project dependencies and add the virtualhost to it's configuration.
* Create you own image with the `docker build` command. Do not forget to specify a tag.

Run your new image with a command similar to this:
```
docker run -d -p 80:80 -p 443:443 -v /path/to/your/project/sources:/var/www/project-root -v /path/to/your/project/data/logs:/var/log/nginx your-image-tag
```


## Self signed certificate

The image comes with a `/gencert.sh` script to generate self signed certificates.

Usage in child Dockerfile:
```
RUN /gencert.sh <domain>
```

Replace `<domain>` with your development hostname.
