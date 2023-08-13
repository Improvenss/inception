FROM alpine:3.15

RUN	apk update \
	&& apk upgrade \
	&& apk add --no-cache \
	vsftpd

COPY conf/vsftpd.conf /tmp/vsftpd.conf

COPY tools/server_ftp.sh /tmp/server_ftp.sh

ENTRYPOINT ["sh", "/tmp/server_ftp.sh"]

# @notes:

# How can i connect this FTP-Server?

# We are installing 'telnet' or 'netcat'.
# $> apt install telnet netcat
# We can connect both way, these ways same. :)
# Connecting localhost's 21 port with telnet.
# $> telnet localhost 21
# Connecting localhost's 21 port with netcat.
# $> nc localhost 21
# After we need to enter USER and PASS.
# $> USER gsever
# $> PASS gsever123
# Look like this;
# root@gsever:/home/gsever/Desktop/inception# nc localhost 21
# 220 Welcome to FTP server of inception!
# USER gsever
# 331 Please specify the password.
# PASS gsever123
# 230 Login successful.

# OR 

# 'ftp' command. (Not 'sftp', because we have user and password.)
# sftp have SSH File Transfer Protocol.
# We can connect with ftp command.
# Installing ftp.
# $> apt install ftp
# $> ftp <server_ip_address_or_hostname>
# How can i learn server ip address?
# 	$> docker inspect <container_id> | grep "IPAddress"
# root@gsever:/home/gsever/Desktop/inception# docker inspect 82cc9a64ca7f | grep "IPAddress"
            # "SecondaryIPAddresses": null,
            # "IPAddress": "",
            #         "IPAddress": "172.18.0.7",
# 	If Debian container;
# 		$> docker exec -it <container_id> hostname -I
# 	If Alpine container;
# 		$> docker exec -it <container_id> ifconfig | grep "inet"
# $> ftp 172.18.0.7
# And enter FTP_USER.
# Last enter FTP_PASS.
# Look like this;
# root@gsever:/home/gsever/Desktop/inception# ftp 172.18.0.7
# Connected to 172.18.0.7.
# 220 Welcome to FTP server of inception!
# Name (172.18.0.7:gsever): gsever
# 331 Please specify the password.
# Password:
# 230 Login successful.
# Remote system type is UNIX.
# Using binary mode to transfer files.
# ftp>

# These ftp is not safe. If you want to safe you need to use;
# SCP(Secure Copy Protocol) or SFTP(SSH File Transfer Protocol)

# OR

# How can i check services is running?
# If 'rc-service' command is not found;
# $> apk add openrc --no-cache
# After checking service status.
# $> rc-service vsftpd status