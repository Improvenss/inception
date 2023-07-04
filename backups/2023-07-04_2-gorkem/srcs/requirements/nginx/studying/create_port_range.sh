#!/bin/bash

for i in {7000..7010}; do
    docker run -d -v /home/gorkem/Desktop/inception/srcs/requirements/nginx/studying/:/usr/share/nginx/html --name test-nginx-port_$i -p $i:80 nginx
done

