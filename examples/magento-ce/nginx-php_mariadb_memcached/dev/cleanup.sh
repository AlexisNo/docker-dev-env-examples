#!/bin/bash

# Retrieve current directory
DIR="$( cd "$( dirname "$0" )" && pwd )"

$DIR/rm.sh
$DIR/rmi.sh

rm -r $DIR/data
rm -r $DIR/../src
