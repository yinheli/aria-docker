#!/bin/bash

# start nginx
nginx

# start aria2c
if [ ! -d "/data/.aria2" ]; then
  mkdir -p /data/.aria2
  touch /data/.aria2/session.dat
fi
aria2c --conf-path=/aria2.conf 
