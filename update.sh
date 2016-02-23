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

for submodule in core web-api france parsers
do
	cd openfisca/$submodule/
	python setup.py develop $user_option
	pip install $user_option --editable .
	cd -
done

for old_symlink_extension in $(find openfisca/france/openfisca_france/model/extensions -type l)
do
	rm $old_symlink_extension
done

for extension in $(ls -d openfisca/extensions/*)
do
	if git submodule | grep $extension
	then
		ln -s $(pwd)/$extension openfisca/france/openfisca_france/model/extensions/
	fi
done
