# LINKS: https://www.cloudways.com/blog/wp-cli-commands/

FROM debian:buster

RUN apt-get update && apt-get install -y \
	wget \
	curl \
	vim \
	bash \
	php7.3 \
	php-cgi \
	php-mysql \
	php-fpm \
	php-pdo \
	php-gd php-cli \
	php-mbstring \
	redis \
	php-redis \
	&& rm -rf /var/lib/apt/lists/*

# LINKS: https://www.digitalocean.com/community/tutorials/how-to-use-wp-cli-v2-to-manage-your-wordpress-site-from-the-command-line
# LINKS: https://blog.sucuri.net/2022/11/wp-cli-how-to-install-wordpress-via-ssh.html
# I need to install wp_cli command and put it in the right directory /usr/local/bin
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

# Copy the .conf in the html directory.
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

# Create the folder to enable php start.
RUN mkdir -p /run/php

# We copy the script, give the right to launch it in local on our computer.
COPY ./tools/create_wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/create_wordpress.sh
# ENTRYPOINT ["/usr/local/bin/create_wordpress.sh"]

# We go the html directory.
WORKDIR /var/www/html/

# We expose the 9000 port.
EXPOSE 9000

# Launch PHP FPM in foreground and ignore deamonize from conf file (-F)
# CMD ["/usr/sbin/php-fpm7.3", "-F"]
CMD ["/usr/local/bin/create_wordpress.sh", "/usr/sbin/php-fpm7.3", "-F"]




# Notes:
# Bu Dockerfile, bir Debian Buster tabanlı PHP-FPM (FastCGI Process Manager)
# 	görüntüsü oluşturur.
# 	PHP-FPM, PHP betiklerini işlemek için kullanılan bir FastCGI uygulamasıdır.

# `RUN mkdir /run/php` komutu, `/run/php` dizinini oluşturur. Bu dizin,
# 	PHP-FPM tarafından kullanılır. Örneğin, PHP-FPM bu dizinde PID
# 	dosyalarını ve Unix soketlerini saklar. Bu nedenle, PHP-FPM'i
# 	çalıştırmak için bu dizinin oluşturulması gerekebilir.

# Bu Dockerfile'da, son satırda `CMD ["/usr/sbin/php-fpm7.3", "-F"]` komutu
# 	ile PHP-FPM ön planda çalıştırılır ve deamonize ayarından bağımsız
# 	olarak çalışır. Bu sayede, Docker konteyneri içinde PHP-FPM süreci
# 	çalıştırılır ve PHP betiklerini işleyebilir.


################

# How can i install Wordpress with wp-cli.phar?
# Download wp-cli.phar file with wget or curl.
# $> curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# If it's not working.
# $> wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# $> chmod -x wp-cli.phar
# $> mv wp-cli.phar /usr/local/bin/wp
# This command changed name wp-cli.phar to wp.
# $> wp core download --allow-root
# Should print this;
# root@6bb88170d326:/# wp core download --allow-root
# Downloading WordPress 6.3 (en_US)...
# md5 hash verified: 096a73a915b72e51aca7dbe94b7f2219
# Success: WordPress downloaded.
# root@6bb88170d326:/#