#!/bin/bash

# Retrieve current directory
DIR="$( cd "$( dirname "$0" )" && pwd )"

$DIR/stop.sh

declare -a containers=(express-mailcatcher express-nodejs express-nginx)

for var in "${containers[@]}"
do

    RUNNING=$(docker inspect --format="{{ .State.Running }}" $var 2> /dev/null)

    if [ $? -eq 0 ]; then
        echo "Removing $var container"
        docker rm ${var}
    fi

done
