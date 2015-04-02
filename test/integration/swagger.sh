#!/bin/bash

HOST=${1:-localhost:2000}
NODE_MODULES_BIN_DIR=`dirname $0`/../../node_modules/.bin

target="http://$HOST/api/1/swagger"

echo "Testing on $target (specify target host as first parameter)"

$NODE_MODULES_BIN_DIR/swagger-tools validate $target
