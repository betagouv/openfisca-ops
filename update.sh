#!/bin/bash
# 1st param (optional): force the target branch to update to. WILL LOSE UNCOMMITTED CHANGES. Defaults to staying on current branch.

set -ex

cd `dirname $0`

if [[ ! $VIRTUAL_ENV ]]
then
	user_option='--user'
fi

if [[ -n $1 ]]
then
	git fetch origin
	git checkout --force origin/$1
fi

git submodule sync
git submodule update --init --recursive


git submodule foreach python setup.py develop $user_option
git submodule foreach pip install $user_option --editable .
