MariaDB docker image for development environment
================================================

## Configuration

The user `root` is accessible outside the container and has no password.

Basic usage:
```
docker run -d -p 3306:3306 -v /path/to/your/project/data/mysql:/var/lib/mysql alexisno/mariadb-dev
```
* `docker run ... alexisno/mariadb-dev` Run MariaDB in a new container
* `-d` Detached mode: Run container in the background
* `-p 3306:3306` Publish the container's port 3306 on the host so you can connect to the sever
* `-v /path/to/your/project/data/mysql:/var/lib/mysql` Mount the volume on a specific directory of the filesystem
