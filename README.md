This repository eases the deployment of a production [OpenFisca](http://openfisca.fr) instance.

> Ce dépôt facilite le déploiement d'une instance d'[OpenFisca](http://openfisca.fr) en production.


Rationale
---------

OpenFisca is comprised of four different parts:

- [`openfisca-core`](https://github.com/openfisca/openfisca-core)
- [`openfisca-france`](https://github.com/openfisca/openfisca-france)
- [`openfisca-parsers`](https://github.com/openfisca/openfisca-parsers)
- [`openfisca-web-api`](https://github.com/openfisca/openfisca-web-api)

At the time of writing, these parts are not packaged and lack a versioning strategy. This makes it pretty hard to deploy a stable instance for production matters.


Solution
--------

This repository references specific versions of each part of OpenFisca, and executes as many tests as possible on the resulting combination through continuous integration.

> You might know this approach from language-specific package managers. It is akin to a `gemfile.lock` or a `shrinkwrap` file.
> However, here, since there is no packaged version of each module, we uniquely reference them through a commit SHA with git [submodules](http://git-scm.com/docs/git-submodule).

The tests come from the few tests that are available within each OpenFisca module, and from client applications that have created their own functional tests such as [`mes-aides`](https://github.com/sgmap/mes-aides-api). We aim at adding as many tests as possible to ensure maximal coverage.


Usage
-----

```
git clone https://github.com/sgmap/openfisca.git && openfisca/init.sh
```
