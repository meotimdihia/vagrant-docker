#!/usr/bin/env bash

set -e

apt-get update

apt-get -y install \
		apache2 \
		php5 \
		php5-mysql \
		php5-dev \
		php5-mcrypt \
		php5-curl \
		php5-imagick \
		php5-xdebug \
		php5-memcached \
		php5-memcache \
		php5-gd \
		php-apc \
		git \
		make \
		curl \
		vim

echo 'mysql-server-5.5 mysql-server/root_password password root1234' | debconf-set-selections
echo 'mysql-server-5.5 mysql-server/root_password_again password root1234' | debconf-set-selections

apt-get -y install \
		mysql-server-5.5 \
		redis-server \
		memcached	

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
<<<<<<< HEAD:d-vagrant/bootstrap.sh
exec /usr/local/bin/run
=======
bash /usr/local/bin/run
>>>>>>> bd36f2da4a9b4bb15bd859f5407782fcbac7053c:vagrant/bootstrap.sh

# enable apache modules
a2enmod rewrite; a2enmod expires; a2enmod auth_basic; a2enmod headers; a2enmod deflate; a2enmod env; a2enmod rewrite;
# enable .htaccess file
sed -i '11s/AllowOverride None/AllowOverride All/'  /etc/apache2/sites-available/default

service apache2 reload

chmod 777 -R /var/www/platform/app/tmp/
chmod 777 -R /var/www/platform/app/webroot/img/Upload/
