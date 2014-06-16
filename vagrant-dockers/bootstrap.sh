#!/usr/bin/env bash

apt-get update

apt-get install -y curl
apt-get install -y vim
apt-get install -y linux-image-generic-lts-raring linux-headers-generic-lts-raring

curl -s https://get.docker.io/ubuntu/ | sudo sh

#docker run -v /home/vagrant/mobplf/:/var/www -p 8080:80 -d apache
