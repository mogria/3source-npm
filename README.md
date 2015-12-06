# 3source-npm

This docker image provides:

 * The `node` javascript runtime
 * The `npm` package manager
 * The `bower` package manager
 * The `gulp` build tool

This image is based on [3source-base](https://github.com/mogria/3source-base).

It downloads the nodejs source and compiles it.

All the tools are run from within the `/data/www` directory.

This image is heavily inspired from [dylanlindgren/docker-laravel-bower](https://github.com/dylanlindgren/docker-laravel-bower).

This image is used to develop the [3source](https://github.com/mogria/3source) project.

View on [dockerhub](https://hub.docker.com/r/mogria/3source-phpcli)
View on [github](https://github.com/mogria/3source-data).
