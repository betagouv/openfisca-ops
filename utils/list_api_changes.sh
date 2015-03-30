#!/bin/bash

cd `dirname $0`/../openfisca/france

git fetch --all

from=${1:-HEAD}
to=${2:-openfisca/master}

git log $from..$to | egrep '(Rename|Introduce|Deprecate) ' | egrep -v '(\(again\)|fixup!)' | sort | uniq

echo "(Listed API changes between $from (`git rev-parse --short $from`) and $to (`git rev-parse --short $to`))"
