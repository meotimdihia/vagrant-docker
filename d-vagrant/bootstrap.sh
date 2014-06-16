#!/usr/bin/env bash

apt-get update

apt-get -y install \
		apache2 \
		php5 \
		php5-mysql \
		php5-dev \
		php5-mcrypt \
		git \
		make \
		curl \
		vim \

# install php-redis
git clone https://github.com/nicolasff/phpredis.git /tmp/phpredis
cd /tmp/phpredis && /usr/bin/phpize && ./configure && make && make install

echo "extension=redis.so" > /etc/php5/conf.d/redis.ini
echo "ServerName localhost" > /etc/apache2/conf.d/httpd.conf
echo "SetEnv APPLICATION_ENV 'development'" >> /etc/apache2/conf.d/httpd.conf

# enable apache modules
a2enmod rewrite; a2enmod expires; a2enmod auth_basic; a2enmod headers; a2enmod deflate; a2enmod env
