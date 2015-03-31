#!/bin/bash

cd `dirname $0`

if [[ $1 != '--dev' ]]  # allow testing new versions locally
then
	git checkout master
	git pull origin master
fi

git submodule sync
git submodule update --init --recursive

git submodule foreach make clean-pyc
git submodule foreach python setup.py develop
git submodule foreach pip install --editable .
