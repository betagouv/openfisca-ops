#!/bin/bash
# 1st param (optional): force the target branch to update to. WILL LOSE UNCOMMITTED CHANGES. Defaults to staying on current branch.

set -ex

cd `dirname $0`

if [[ -n $1 ]]
then git checkout --force origin/$1
fi

git submodule sync
git submodule update --init --recursive

git submodule foreach python setup.py develop --user
git submodule foreach pip install --user --editable .
