Nginx docker image for development environment
==============================================

Basic usage:
```
docker run -d -p 80:80 -p 443:443 alexisno/nginx-dev
```
* `docker run ... alexisno/nginx-dev` create a new container based on the image
* `-d` Detached mode: Run container in the background
* `-p 80:80 -p 443:443` Publish the container's ports 80 and 443 on the host so you can connect to the server

Open a brower at http://localhost/ and/or https://localhost/
