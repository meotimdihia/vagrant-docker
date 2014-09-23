#!/bin/bash

# start ssh server
/usr/sbin/sshd -D &

# start apache server
/usr/sbin/apache2 -D FOREGROUND