#!/bin/bash

cd `dirname $0`

HOST=${1:-localhost:2000}
FORMULAS_LIST_PATH=${2:-formula_taxes.txt}

target="http://$HOST/api/2/formula/"

echo "Testing on $target (specify host as first parameter)"
echo "---------------------------------------------------------"

failures=0

for tax in `cat $FORMULAS_LIST_PATH`
do
	echo -n $tax,

	if ! lwp-request -sd -m GET $target/$tax
	then let failures++
	fi
done

echo "---------------------------"
echo "$failures failures on $HOST"

exit `[ $failures -eq 0 ]`
