# @link https://exampleconfig.com/view/mariadb-debian10-etc-mysql-mariadb-conf-d-50-server-cnf
# @link https://linuxhostsupport.com/blog/how-to-import-an-sql-file-into-mysql-database/#:~:text=If%20you%20want%20to%20create,localhost'%20IDENTIFIED%20BY%20'password'%3B

FROM	debian:buster

RUN		apt update && \
apt install -y mariadb-server

COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
RUN		chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf
COPY	./conf/createdb.sql /
#sadece port açılıyor ve bind ip kapatılıyor
RUN		service mysql start && mysql < createdb.sql && rm -f create.sql

EXPOSE	3306

CMD		/usr/bin/mysqld_safe
# This mysqld_safe command; If any problem occurs, restarting the server safely and saving runtime error log.