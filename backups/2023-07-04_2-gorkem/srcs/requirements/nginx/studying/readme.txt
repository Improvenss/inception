If you want to test this 'index.html' file for Nginx ports, run this command.

docker run -d --name test-nginx-volume_8001 -p 8001:80 -v /home/$USER/Desktop/inception/srcs/requirements/nginx/studying/:/usr/share/nginx/html nginx

or this command

docker run -d -v /home/gorkem/Desktop/inception/srcs/requirements/nginx/studying/:/usr/share/nginx/html --name test-nginx-port_8000 -p 8000:80 nginx

But don't forget; after the -v flag -> left side : right side -> the left side is your local machine's location. The right side is your created/runned container's location.

Creating port range;

#!/bin/bash

for i in {7000..8000}; do
    docker run -d -v /home/gorkem/Desktop/inception/srcs/requirements/nginx/studying/:/usr/share/nginx/html --name test-nginx-port_$i -p $i:80 nginx
done

