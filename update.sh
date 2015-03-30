#!/bin/bash

cd `dirname $0`

git checkout master
git pull origin master
git submodule sync
git submodule update --init --recursive

git submodule foreach python setup.py develop
git submodule foreach pip install --editable .
