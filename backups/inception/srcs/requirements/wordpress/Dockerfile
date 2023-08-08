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