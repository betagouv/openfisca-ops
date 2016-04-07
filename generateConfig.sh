#!/bin/bash
# 1st param = config name.
# Available configs are in `config` folder.
PORT=${PORT:-2000}

cd `dirname $0`

sed s/%PORT%/$PORT/ config/$1.ini > config/current.ini
