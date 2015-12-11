#!/bin/bash
# 1st param = config name. Defaults to `development`.
# Available configs are in `config` folder.

paster serve --reload `dirname $0`/config/${1:-development}.ini
