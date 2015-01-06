#!/bin/bash

# Retrieve current directory
DIR="$( cd "$( dirname "$0" )" && pwd )"

$DIR/rm.sh

docker rmi sails-nodejs-image sails-nginx-image
