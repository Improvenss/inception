#!/bin/sh

mysql_install_db

/etc/init.d/mysql start

#Check if the database exists

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then 
	echo "Database already exists"
else

# Set root option so that connection without root password is not possible

mysql_secure_installation << _EOF_

Y
root4life
root4life
Y
n
Y
Y
_EOF_

# @link: https://www.digitalocean.com/community/tutorials/how-to-allow-remote-access-to-mysql

# mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /usr/local/bin/create_database.sql

#Add a root user on 127.0.0.1 to allow remote connection 
#Flush privileges allow to your sql tables to be updated automatically when you modify it
#mysql -uroot launch mysql command line client
echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot

#Create database and user in the database for wordpress

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot

#Import database in the mysql command line
# if [ -e /usr/local/bin/wordpress.sql ]; then
# 	echo "/usr/local/bin/wordpress.sql FOUND OK.";
# # mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /usr/local/bin/wordpress.sql
# 	echo "FINISHED BRUH";
# fi

# @link: https://www.interserver.net/tips/kb/import-export-databases-mysql-command-line/

#Import database in the mysql command line
# mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /usr/local/bin/wordpress.sql

fi

/etc/init.d/mysql stop

# CMD ["/usr/local/bin/mariadb.sh", "mysqld", "--bind-address=0.0.0.0"]
# For this exec command look like:
# mariadb.sh mysqld --bind-address=0.0.0.0
# exec "@" = mariadb.sh mysqld --bind-address=0.0.0.0
exec "$@"