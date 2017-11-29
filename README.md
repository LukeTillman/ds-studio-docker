# Archived: Use DataStax official Docker images

DataStax has started offering [official Docker images][datastax-docker] for development environments, which is great news! I 
was fortunate to be involved in the planning and creation of those images, so if you were using this image before, transitioning
to the new official images should involve minimal or no changes. This repository is now archived and not actively maintained. I
encourage you to check out the new [official Docker images][datastax-docker] and open issues/PRs there to help us improve them.

Thanks to everyone who helped make this image better by opening issues and PRs. And thanks to everyone who used this image which
ultimately played a small role in encouraging DataStax to release official images of their own.

---

# DataStax Studio Docker

[![Build Status](https://travis-ci.org/LukeTillman/ds-studio-docker.svg?branch=master)](https://travis-ci.org/LukeTillman/ds-studio-docker)

A Docker image for [DataStax Studio][datastax-studio]. Please use the [GitHub repository][github-repo]
for opening issues.

## Usage

**Note:** It's also possible to just install DataStax Studio on your local Mac or Windows 
machine instead of running it inside of a Docker container.

### Starting DataStax Studio

Currently, DataStax Studio doesn't have any commandline options so starting it is pretty
straightforward:

```console
> docker run --name my-studio -d -p 9091:9091 luketillman/datastax-studio:TAG
```

Replace `TAG` with the version you'd like to run. The `-p 9091:9091` will expose the web 
interface for Studio on port 9091 of the host. So, for example, if you're using Docker for 
Windows or Docker for Mac on your local machine, you should then be able to open a browser and 
go to `http://localhost:9091` to view the UI.

Remember that any DataStax Studio container you run needs to be able to talk to your DataStax 
Enterprise Graph cluster via the network.

### Starting with Docker Compose

Chances are that if you're trying to use this image, you also want to start a node of DataStax 
Enterprise in graph mode so you can use Studio to try out DSE Graph. Docker Compose tends to be
an easy way to start multiple containers for something like this. There is an example 
[`docker-compose.yml`][docker-compose] file in the GitHub repo that shows how to do this along 
with my [DSE Docker][dse-docker] image.

> **Note:** Be sure to **read the comments** in that `yml` file on how to properly use it. It 
> currently requires an externally created network in order to get around some limitations of 
> Docker Compose.

### Volumes

The following volumes are created and can be mounted to the host system:

- **`/opt/studio/conf`**: Configuration file(s) for DataStax Studio.
- **`/opt/studio/userdata`**: Location where user data is saved (notebooks, etc.)

## Builds

Build and publish scripts are available in the `build` folder of the repository. All those 
scripts are meant to be run from the root of the repository. For example:

```console
> ./build/docker-build.sh
```

Continuous integration builds are handled by Travis.

[datastax-docker]: https://github.com/datastax/docker-images
[datastax-studio]: http://www.datastax.com/products/datastax-devcenter-and-development-tools
[github-repo]: https://github.com/LukeTillman/ds-studio-docker
[docker-hub]: https://hub.docker.com/r/luketillman/datastax-studio/
[docker-compose]: https://github.com/LukeTillman/ds-studio-docker/blob/master/examples/docker-compose.yml
[dse-docker]: https://hub.docker.com/r/luketillman/datastax-enterprise/
