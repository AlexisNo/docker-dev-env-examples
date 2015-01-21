Memcached docker image for development environment
==================================================

## Configuration

Default memcached service configuration. Remote connection enabled.

Basic usage:
```
docker run -d -p 11211:11211 alexisno/memcached-dev
```
* `docker run ... alexisno/memcached-dev` Run memcached in a new container
* `-d` Detached mode: Run container in the background
* `-p 11211:11211` Publish the container's port 11211 on the host so you can connect to the sever
