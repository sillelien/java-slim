#!/usr/bin/env bash
set -ex
cd helloworld && mvn clean install -Dmaven.test.skip=true && cd -
cd builder
docker build -t java-slim .
cd -
cd helloworld
docker run -ti -v /var/run:/var/run -v $(pwd)/:/build/ java-slim helloworld hello-world target/java-slim.helloworld-1.0-SNAPSHOT.jar src/main/resources sillelien.HelloWorld
cd -
docker run -ti helloworld

