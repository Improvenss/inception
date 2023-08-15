FROM debian:buster

RUN apt-get update
RUN apt-get install -y redis \
	&& rm -rf /var/lib/apt/lists/*

COPY ./tools/redis.sh /tmp/redis.sh

EXPOSE 6379

CMD ["/tmp/redis.sh"]
# CMD ["sh", "/tmp/redis.sh"]

# How can i check Redis-service is running?

# Go inside 'redis' container; 
# $> docker exec -it <container_id> bash
# You will see -> root@9cf8f050c399:/#

# $>cd /etc/redis
# You will see -> root@9cf8f050c399:/etc/redis#
# You can see /etc/redis/redis.conf file.
# (Writed inside ./tools/redis.sh file's configurated file.)

# If you want to check if redis-server is running;
# $> sudo service --status-all
# You will see;
# root@b52377818af9:/etc/redis# service --status-all
#  [ ? ]  hwclock.sh
#  [ - ]  redis-server
# OR
# We are writing shell from 'Virtual Machine', not container inside.
# $> sudo lsof -i :6379
# root@yuandre:/home/gsever/Desktop/inception# lsof -i :6379
# COMMAND     PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
# docker-pr 37724 root    4u  IPv4 100229      0t0  TCP *:redis (LISTEN)
# docker-pr 37732 root    4u  IPv6 100234      0t0  TCP *:redis (LISTEN)
# OR
# $> redis-cli PING
# It need to return 'PONG'.
# 172.18.0.8:6379> PING
# PONG
# 172.18.0.8:6379>
# OR
# 172.18.0.8:6379> set key value [expiration EX seconds|PX milliseconds] [NX|XX]
# 172.18.0.8:6379> set asdf "hello:my_friend"
# OK
# 172.18.0.8:6379> get asdf
# "hello:my_friend"
# 172.18.0.8:6379>
# Btw this 172.18.0.8 -> this 'redis' container's IP -> hostname -I
# OR
# $> redis-server
# OR
# We are writing shell from 'Virtual Machine', not container inside.
# $> docker exec -it b52377818af9 service redis-server status
# OR
# LINK: https://redis.io/commands/monitor/
# We are testing with 'telnet'.
# $> apt install -y telnet
# This command like 'redis-cli MONITOR'.
# $> telnet localhost 6379
# Will see like this;
# Trying ::1...
# Connected to localhost.
# Escape character is '^]'.
# After you can write MONITOR, PING, set asdf 'hello', etc...
# When you restart your localhost(wordpress page) in your browser,
# you can see this cache variables.