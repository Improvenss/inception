FROM alpine:3.15

# install prerequisites
# https://wordpress.com/support/php-environment/
RUN apk update && \
	apk add --no-cache \
	curl \
	less \
	mariadb-client \
	php8 \
	php8-fpm \
	php8-common \
	php8-session \
	php8-iconv \
	php8-json \
	php8-gd \
	php8-curl \
	php8-xml \
	php8-mysqli \
	php8-imap \
	php8-pdo \
	php8-pdo_mysql \
	php8-soap \
	php8-posix \
	php8-gettext \
	php8-ldap \
	php8-ctype \
	php8-dom \
	php8-simplexml \
	&& rm -rf /var/cache/apk/*

#RUN the adminer part, create html directory, move the adminer directory and add user

RUN \
	curl -L -O https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
	mkdir -p /var/www/html && \
	mv ./adminer-4.8.1.php /var/www/html/index.php && \
	adduser -u 82 -D -S -G www-data www-data

COPY /conf/www.conf /etc/php8/php-fpm.d/www.conf

EXPOSE 9000

STOPSIGNAL SIGQUIT

CMD ["php-fpm8", "--nodaemonize"]






# FROM alpine:3.12.0

# RUN apk update ; \
# 	apk add php7-common php7-iconv php7-json php7-gd php7-curl php7-xml \
# 	php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc \
# 	php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7 php7-fpm php7-opcache php7-session; \
# 	rm -rf /var/cache/apk/*
# #adminer için gerekli paketler yükleniyor
# RUN wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php"
# #https://github.com/vrana/adminer/
# RUN mv adminer-4.8.1.php index.php

# # CMD ["php", "-S", "0.0.0.0:8080"]
# CMD ["php", "-S", "0.0.0.0:9000"]
# #8080 portu adminer için ayrılıyor
# #9000 portu adminer için ayrılıyor



# NOTE: "apk" paket yöneticisindeki "--no-cache" bayrağı, paket
# 	yöneticisinin paket dizininin yerel önbelleğini kullanmasını
# 	engellemek için kullanılır ve bunun yerine, dizini ağdan 
# 	almaya zorlar. Bu, paketleri kurmayı tamamladığınızda
# 	`--update-cache` kullanma ve `/var/cache/apk/*` kaldırma ihtiyacını
# 	ortadan kaldırdığından kapları küçük tutmak için yararlı olabilir.

# EN:
# The command `adduser -u 82 -D -S -G www-data www-data` creates
# 	a user named `www-data` and adds this user to the group named
# 	`www-data`. This command contains the following options:
# - `-u 82`: Sets the user's UID (User ID) to 82.
# - `-D`: Does not create the user's home directory.
# - `-S`: Does not set the user's login shell.
# - `-G www-data`: Adds the user to the group named `www-data`.
# This command is usually used to create a user for applications
# 	running on web servers. For example, web servers like Apache
# 	or Nginx usually run under a user named `www-data`.
# TR:
# `adduser -u 82 -D -S -G www-data www-data` komutu, `www-data`
# 	adlı bir kullanıcı oluşturur ve bu kullanıcıyı `www-data`
# 	adlı gruba ekler. Bu komut aşağıdaki seçenekleri içerir:
# - `-u 82`: Kullanıcının UID'sini (Kullanıcı Kimliği) 82
# 	olarak ayarlar.
# - `-D`: Kullanıcının ev dizinini oluşturmaz.
# - `-S`: Kullanıcının giriş kabuğunu ayarlamaz.
# - `-G www-data`: Kullanıcıyı `www-data` adlı gruba ekler.
# Bu komut genellikle, web sunucularında çalışan uygulamalar
# 	için bir kullanıcı oluşturmak amacıyla kullanılır. Örneğin,
# 	Apache veya Nginx gibi web sunucuları genellikle `www-data`
# 	adlı bir kullanıcı altında çalışır.
