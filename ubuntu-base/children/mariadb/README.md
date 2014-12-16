MariaDB Dockerfile for dev environment
======================================

MariaDB server
--------------

### Configuration

The user `root` is not accessible outside the container. His password is `root`.

The user `admin` can log from anywhere. His password is `admin`.

Basic usage:
```
docker run -d -p 3306:3306 -v /path/to/your/project/data/mysql:/var/lib/mysql alexisno/mariadb
```
* `docker run ... alexisno/mariadb` Run MariaDB in a new container
* `-d` Detached mode: Run container in the background
* `-p 3306:3306` Publish the container's port 3306 to the host so you can connect to the sever
* `-v /path/to/your/project/data/mysql:/var/lib/mysql` Mount the volume on a specific directory of the filesystem
