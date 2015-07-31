FROM debian:jessie
RUN apt-get update && apt-get install -y build-essential gcc-multilib g++-multilib openjdk-7-jre-headless wget apt-transport-https
RUN echo deb http://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list && \
    apt-key adv --keyserver pgp.mit.edu --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9 && \
    apt-get update && \
    apt-get install -y lxc-docker-1.5.0
COPY lib/* /app/
COPY wrap.sh /wrap.sh
VOLUME /build
ENTRYPOINT ["/wrap.sh"]

