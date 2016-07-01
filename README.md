This repository eases the deployment of the production [OpenFisca](http://openfisca.fr) instance used by mes-aides.gouv.fr.

> Ce dépôt facilite le déploiement de l'instance d'[OpenFisca](http://openfisca.fr) utilisée en production pour mes-aides.gouv.fr.


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
git clone https://github.com/sgmap/openfisca.git && openfisca/update.sh && openfisca/start.sh
```

### Extensions
To add an extension to this repository:
```sh
git submodule add $extension_repository openfisca/extensions/$extension_name
```
