#!/bin/bash

cd `dirname $0`/../openfisca/france

git fetch --all

from=${1:-sgmap/master}
to=${2:-openfisca/master}

git log $from..$to | egrep '(Rename|Introduce|Deprecate)' | egrep -v '(\(again\)|fixup!)' | sort | uniq

echo "(Listed API changes between $from and $to)"
