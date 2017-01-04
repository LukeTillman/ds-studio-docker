# DataStax Studio Docker

[![Build Status](https://travis-ci.org/LukeTillman/ds-studio-docker.svg?branch=master)](https://travis-ci.org/LukeTillman/ds-studio-docker)

A Docker image for [DataStax Studio][datastax-studio]. 

## Usage

> **Note:** It's also possible to just install DataStax Studio on your local Mac or Windows
> machine instead of running it inside of a Docker container.

See the [Docker Hub Page][docker-hub] for more details on running this image. There is also an
example [`docker-compose.yml`][docker-compose] file in the `examples` folder that shows how to
spin up a node of DataStax Enterprise along with Studio using Docker Compose.

## Builds

Build and publish scripts are available in the `build` folder. All those scripts are meant to be
run from the root of the repository. For example:

```
> ./build/docker-build.sh
```

Continuous integration builds are handled by Travis.

[datastax-studio]: http://www.datastax.com/products/datastax-devcenter-and-development-tools
[docker-hub]: https://hub.docker.com/r/luketillman/datastax-studio/
[docker-compose]: https://github.com/LukeTillman/ds-studio-docker/blob/master/examples/docker-compose.yml