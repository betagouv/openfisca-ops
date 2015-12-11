#!/bin/bash
# 1st param (optional): target branch. Defaults to master.
TARGET_BRANCH=${1:-master}

set -ex

cd `dirname $0`

git checkout $TARGET_BRANCH
git pull origin $TARGET_BRANCH

git submodule sync
git submodule update --init --recursive

git submodule foreach python setup.py develop
git submodule foreach pip install --user --editable .
