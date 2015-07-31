# Java Slim

Java Slim uses packr and Docker to produce a small Docker image for your Java app


## Build a Docker image from the current directory

This builds a working Docker image from the current directory based on  [sillelien/jess:master](https://registry.hub.docker.com/u/sillelien/jess/) - so they are pretty small.

```
   docker run -ti -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):/build sillelien/java-slim:master image-tag executable-name jar-file resources-dir main-class
```

[![Docker Registry](https://img.shields.io/docker/pulls/sillelien/java-slim.svg)](https://registry.hub.docker.com/u/sillelien/java-slim)

[![Image Layers](https://badge.imagelayers.io/sillelien/java-slim.svg)](https://imagelayers.io/?images=sillelien/java-slim:master 'Get your own badge on imagelayers.io') 


## Badges

[![Circle CI](https://circleci.com/gh/Sillelien/java-slim/tree/master.svg?style=svg)](https://circleci.com/gh/Sillelien/java-slim/tree/master)

[![GitHub License](https://img.shields.io/github/license/sillelien/java-slim.svg)](https://raw.githubusercontent.com/sillelien/java-slim/master/LICENSE)

[![GitHub Issues](https://img.shields.io/github/issues/sillelien/java-slim.svg)](https://github.com/sillelien/java-slim/issues)