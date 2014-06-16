FROM ubuntu:12.04

MAINTAINER Dien Vu "dien@mobgame.vn"

RUN apt-get update

# install apache + php + php mods
RUN apt-get -y install \
		apache2 \
		php5 \
		php5-mysql \
		php5-dev \
		php5-mcrypt \
		git \
		make

# install php-redis
RUN git clone https://github.com/nicolasff/phpredis.git /tmp/phpredis
RUN cd /tmp/phpredis && /usr/bin/phpize && ./configure && make && make install

RUN echo "extension=redis.so" > /etc/php5/conf.d/redis.ini
RUN echo "ServerName localhost" > /etc/apache2/conf.d/httpd.conf
RUN echo "SetEnv APPLICATION_ENV 'development'" >> /etc/apache2/conf.d/httpd.conf

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

# Set the default timezone in both cli and apache configs
#RUN sed -i 's/\;date\.timezone\ \=/date\.timezone\ \=\ Asia\/Ho_Chi_Minh/g' /	
#RUN sed -i 's/\;date\.timezone\ \=/date\.timezone\ \=\ Asia\/Ho_Chi_Minh/g' /etc/php5/apache2/php.ini

# enable apache modules
RUN a2enmod rewrite; a2enmod expires; a2enmod auth_basic; a2enmod headers; a2enmod deflate; a2enmod env



# install ssh-server
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:123456' |chpasswd

ADD ./startup.sh /opt/startup.sh
RUN chmod 0755 /opt/startup.sh

EXPOSE 80
EXPOSE 22

ENTRYPOINT ["/opt/startup.sh"]