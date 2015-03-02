#!/bin/bash

cd `dirname $0`

git checkout master
git pull origin master
git submodule sync
git submodule update --init --recursive
