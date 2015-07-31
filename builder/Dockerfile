FROM debian:jessie
RUN apt-get update && apt-get install -y build-essential gcc-multilib g++-multilib openjdk-7-jre-headless wget
RUN wget -qO- https://get.docker.com/ | sh
COPY lib/* /app/
COPY wrap.sh /wrap.sh
ENTRYPOINT ["/wrap.sh"]

