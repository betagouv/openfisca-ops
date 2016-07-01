#!/bin/bash

cd `dirname $0`

./generateMesAidesConfig.sh

paster serve --reload config/current.ini
