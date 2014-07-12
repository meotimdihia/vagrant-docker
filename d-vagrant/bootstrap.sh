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
		vim

echo 'mysql-server-5.5 mysql-server/root_password password root1234' | debconf-set-selections
echo 'mysql-server-5.5 mysql-server/root_password_again password root1234' | debconf-set-selections

apt-get -y install \
		mysql-server-5.5 \
		redis-server		

# install php-redis
git clone https://github.com/nicolasff/phpredis.git /tmp/phpredis
cd /tmp/phpredis && /usr/bin/phpize && ./configure && make && make install
# enable redis
echo "extension=redis.so" > /etc/php5/conf.d/redis.ini
# set servername
echo "ServerName localhost" > /etc/apache2/conf.d/httpd.conf
# set apache evn to development
echo "SetEnv APPLICATION_ENV 'development'" >> /etc/apache2/conf.d/httpd.conf
# copy mysql's config files 
cp /home/vagrant/mysql-server-setup/my.cnf /etc/mysql/conf.d/my.cnf
chmod 664 /etc/mysql/conf.d/my.cnf
cp /home/vagrant/mysql-server-setup/run /usr/local/bin/run
chmod +x /usr/local/bin/run
# run setup db and user for mysql
exec /usr/local/bin/run

# enable apache modules
a2enmod rewrite; a2enmod expires; a2enmod auth_basic; a2enmod headers; a2enmod deflate; a2enmod env

service apache2 reload
