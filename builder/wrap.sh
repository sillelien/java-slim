#!/usr/bin/env sh
set -e
tag=$1
shift
executable=$1
shift
jar=$1
shift
resources=$1
shift
main=$(echo $1 | tr '.' '/')
shift

vmargs=${JVM_ARGS:--Xmx128m}
jremin=${JRE_MINIMIZE:-hard}

java -jar /app/packr.jar \
     -platform linux64 \
     -jdk "/app/zulu1.8.0_45-8.7.0.5-x86lx64.zip" \
     -executable $executable \
     -appjar /build/$jar \
     -mainclass $main \
     -vmargs "$vmargs" \
     -resources /build/$resources \
     -minimizejre "$jremin" \
     -outdir /out

mkdir -p /out
cd /out

if [ -z "$BASE_IMAGE" ]
then
    BASE_IMAGE="sillelien/jess:master"
fi

echo "Creating Dockerfile for $executable from $BASE_IMAGE" >&2
cat > Dockerfile <<EOF
FROM $BASE_IMAGE
COPY . /app
WORKDIR /app
ENTRYPOINT ["/init","/app/$executable"]
EOF

echo "/etc/default/docker"
echo 'DOCKER_OPTS="-H unix:///var/run/docker.sock"' >>  /etc/default/docker
#ls -la /var/run/docker.sock
ls -la /var/run
echo "Building Docker Image $tag" >&2

docker build -t "$tag" .

echo "Built successfully, you can run now with: "  >&2
echo "$ docker run -ti $tag" >&2



