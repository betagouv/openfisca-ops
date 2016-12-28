# This repository is deprecated

The official [OpenFisca documentation](https://doc.openfisca.fr/en/for_developers.html) now explains how to install OpenFisca and its stack.

OpenFisca has started to be properly packaged mid-2016. At the end of 2016, we've been able to confirm that the [published packages](https://pypi.python.org/pypi/OpenFisca-France) work well and we switched [our products](https://github.com/sgmap/mes-aides-ui/pull/384/files#diff-b9cfc7f2cdf78a7f4b91a753d10865a2R76) to use `pip`. After 8 weeks without issues, this repository —which was working around the lack of packaging— is now deprecated.

The text below still accurately describes what this repository does, but this workaround is not necessary anymore, and using it would be counterproductive.

- - - - -

This repository eases the deployment of a production [OpenFisca](http://openfisca.fr) instance.

> Ce dépôt facilite le déploiement d'une instance d'[OpenFisca](http://openfisca.fr) en production.


Rationale
---------

OpenFisca is comprised of four different parts, to which you can add optional [extensions](http://doc.openfisca.fr/contribute/extensions.html):

- [`openfisca-core`](https://github.com/openfisca/openfisca-core)
- [`openfisca-france`](https://github.com/openfisca/openfisca-france)
- [`openfisca-parsers`](https://github.com/openfisca/openfisca-parsers)
- [`openfisca-web-api`](https://github.com/openfisca/openfisca-web-api)

Example of extension: [`openfisca-paris`](https://github.com/sgmap/openfisca-paris).

At the time of writing, these parts are not packaged and lack a versioning strategy. This makes it pretty hard to deploy a stable instance for production matters.


Solution
--------

This repository references specific versions of each part of OpenFisca (as well as the extensions to include in the instance) and executes as many tests as possible on the resulting combination through continuous integration.

> You might know this approach from language-specific package managers. It is akin to a `gemfile.lock` or a `shrinkwrap` file.
> However, here, since there is no packaged version of each module, we uniquely reference them through a commit SHA with git [submodules](http://git-scm.com/docs/git-submodule).

The tests come from the few tests that are available within each OpenFisca module, and from client applications that have created their own functional tests such as [`mes-aides`](https://github.com/sgmap/mes-aides-api). We aim at adding as many tests as possible to ensure maximal coverage.


Usage
-----

### Prerequisites

- Execute the scripts matching your host machine in the `bootstrap` folder.


### Run

```
git clone https://github.com/sgmap/openfisca.git && openfisca/update.sh
```

### Extensions
To add an extension to this repository:
```sh
git submodule add $extension_repository openfisca/extensions/$extension_name
```
