FROM ubuntu:12.04

MAINTAINER Dien Vu "dien@mobgame.vn"

RUN apt-get update

# install redis
RUN apt-get -y install redis-server

EXPOSE 6379

ENTRYPOINT  ["/usr/bin/redis-server"]