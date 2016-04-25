#!/bin/bash
PORT=${PORT:-2000}

cd `dirname $0`

sed s/%PORT%/$PORT/ config/mes-aides.ini > config/current.ini
