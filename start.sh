#!/bin/bash
# 1st param = config name. Defaults to `development`.
# Available configs are in `config` folder.
PORT=${PORT:-2000}

cd `dirname $0`

sed s/%PORT%/$PORT/ config/${1:-development}.ini > config/current.ini

paster serve --reload config/current.ini
