# Java Slim

Java Slim uses packr and Docker to produce a small Docker image for your Java app

**If you use this image please consider giving it a star on [Github](https://github.com/Sillelien/jess-builder)**

## Build a Docker image from the current directory

This builds a working Docker image from the current directory based on  [sillelien/jess:master](https://registry.hub.docker.com/u/sillelien/jess/) - so they are pretty small.

The final Java Docker image produced starts from 69MB unpacked compared to the smallest Java+Docker image of 165Mb. The docker image includes glibc, core debian files, busybox and S6 process supervisor - so you're not cutting corners.

```
   docker run -ti -v /var/run/docker.sock:/tmp/docker.sock -v $(pwd):/build sillelien/java-slim:master image-tag executable-name jar-file resources-dir main-class
```

For example:

```
docker run -ti -v /var/run/docker.sock:/tmp/docker.sock -v $(pwd):/build java-slim helloworld hello-world target/java-slim.helloworld-1.0-SNAPSHOT.jar src/main/resources sillelien.HelloWorld
```

THis will produce an 82MB (uncompressed) Docker image.

## Environment Variables

Additional configuration can be passed into the docker run command as environment variables, they are:

* JVM_ARGS - default JVM args to be used on every execution
* JRE_MINIMIZE - the level of JRE minimization performed by packr hard/soft (default 'hard')


[![Docker Registry](https://img.shields.io/docker/pulls/sillelien/java-slim.svg)](https://registry.hub.docker.com/u/sillelien/java-slim)

[![Image Layers](https://badge.imagelayers.io/sillelien/java-slim.svg)](https://imagelayers.io/?images=sillelien/java-slim:latest 'Get your own badge on imagelayers.io') 


## Badges

[![Circle CI](https://circleci.com/gh/Sillelien/java-slim/tree/master.svg?style=svg)](https://circleci.com/gh/Sillelien/java-slim/tree/master)

[![GitHub License](https://img.shields.io/github/license/sillelien/java-slim.svg)](https://raw.githubusercontent.com/sillelien/java-slim/master/LICENSE)

[![GitHub Issues](https://img.shields.io/github/issues/sillelien/java-slim.svg)](https://github.com/sillelien/java-slim/issues)
