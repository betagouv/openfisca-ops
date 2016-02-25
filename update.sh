#!/bin/bash
# 1st param (optional): force the target branch to update to. WILL LOSE UNCOMMITTED CHANGES. Defaults to staying on current branch.

set -ex

cd `dirname $0`

if [[ -n $1 ]]
then
	git fetch origin
	git checkout --force origin/$1
fi

git submodule sync
git submodule update --init --recursive


for old_symlink_extension in $(find openfisca/france/openfisca_france/model/extensions -type l)
do
	rm $old_symlink_extension
done

git submodule foreach '$toplevel/install_submodule.sh $path $toplevel'
