#!/bin/bash
# 1st param = config name. Defaults to `development`.
# Available configs are in `config` folder.

cd `dirname $0`

paster serve --reload config/${1:-development}.ini
