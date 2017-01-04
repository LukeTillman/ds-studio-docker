# DataStax Studio on Docker

> **Note:** It's also possible to just install DataStax Studio on your Mac or Windows machine
> instead of running it in a Docker container.

The repository for this image is [available on GitHub][github-repo]. Please use that to open
issues.

## Starting DataStax Studio

Currently, DataStax Studio doesn't have any commandline options so starting it is pretty
straightforward:

```
> docker run --name my-studio -d -p 9091:9091 luketillman/datastax-studio:TAG
```

Replace `TAG` with the version you'd like to run. The `-p 9091:9091` will expose the web
interface for Studio on port 9091 of the host. So, for example, if you're using Docker for
Windows or Docker for Mac on your local machine, you should then be able to open a browser and
go to `http://localhost:9091` to view the UI.

Remember that any DataStax Studio container you run needs to be able to talk to your DataStax
Enterprise Graph cluster via the network.

## Usage with Docker Compose

Chances are that if you're trying to use this image, you also want to start a node of DataStax
Enterprise in graph mode so you can use Studio to try out DSE Graph. Docker Compose tends to be
an easy way to start multiple containers for something like this. There is an example
[`docker-compose.yml`][docker-compose] file in the GitHub repo that shows how to do this using
my [DSE Docker][dse-docker] image.

> **Note:** Be sure to **read the comments** in that `yml` file on how to properly use it. It
> currently requires an externally created network in order to get around some limitations of
> Docker Compose.

## Volumes

The following volumes are created and can be mounted to the host system:

- **`/opt/studio/conf`**: Configuration file(s) for DataStax Studio.
- **`/opt/studio/userdata`**: Location where user data is saved (notebooks, etc.)

[github-repo]: https://github.com/LukeTillman/ds-studio-docker
[docker-compose]: https://github.com/LukeTillman/ds-studio-docker/blob/master/examples/docker-compose.yml
[dse-docker]: https://hub.docker.com/r/luketillman/datastax-enterprise/