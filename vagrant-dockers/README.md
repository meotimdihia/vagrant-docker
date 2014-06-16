TIPS
====
Remove all containers: docker rm `docker ps --no-trunc -a -q`
Overwrite entryponit and access docker: docker run -i -t --entrypoint="/bin/bash" -p 23:22 <image> -i

docker run -d -p 6379:6379 --name redis meotimdihia/redis

docker run -d -p 3306:3306 --name mysql --env-file /home/vagrant/sync_folders/dockerfiles/mysql-server/env.list meotimdihia/mysql-server

sudo docker run -d -v /home/vagrant/platform/:/var/www/platform/ -p 8080:80 -p 23:22 --name platform --link mysql:db --link redis:redis meotimdihia/platform