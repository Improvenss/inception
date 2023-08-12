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