MongoDB docker image for development environment
================================================

Basic usage:
```
docker run -d -p 27017:27017 -v /path/to/your/project/data/mongodb:/data/db alexisno/mongodb-dev
```
* `docker run ... alexisno/mongodb-dev` Run MongoDB in a new container
* `-d` Detached mode: Run container in the background
* `-p 27017:27017` Publish the container's port 27017 on the host so you can connect to the sever
* `-v /path/to/your/project/data/mongodb:/data/db` Mount the volume on a specific directory of the filesystem
