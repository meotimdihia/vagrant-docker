#!/usr/bin/env bash

apt-get update

apt-get install -y curl
apt-get install -y vim
apt-get install -y linux-image-generic-lts-raring linux-headers-generic-lts-raring

curl -s https://get.docker.io/ubuntu/ | sudo sh

sudo docker build -t meotimdihia/redis /home/vagrant/sync_folders/dockerfiles/redis/
sudo docker build -t meotimdihia/mysql-server /home/vagrant/sync_folders/dockerfiles/mysql-server/
sudo docker build -t meotimdihia/platform /home/vagrant/sync_folders/dockerfiles/apache-platform/
