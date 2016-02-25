path=$1
toplevel=$2

# Sandbox the install to the virtualenv, or, if not available, to the user.
if [[ ! $VIRTUAL_ENV ]]
then
	user_option='--user'
fi

if echo $path | grep openfisca/extensions -q
then
	ln -s $toplevel/$path $toplevel/openfisca/france/openfisca_france/model/extensions/
else
	python setup.py develop $user_option
	pip install $user_option --editable .
fi
