FROM	debian:buster

ENV USER=gsever

RUN apt-get update && apt-get install -y \
	--no-install-recommends apt-utils \
	nginx \
	openssl

# nginx SSL
# RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/ssl/certs/gsever.crt \
	-keyout /etc/ssl/certs/gsever.key \
	-subj "/C=TR/ST=Kocaeli/L=Istanbul/O=Ecole42/OU=gsever/CN=gsever"

COPY ./conf/nginx.conf /etc/nginx/conf.d

# nginx config
RUN mkdir -p /run/nginx

EXPOSE 443

# COPY /etc/ssl/certs/gsever.crt /var/www/html/
# RUN cp /etc/ssl/certs/gsever.crt /var/www/html/
RUN cp /etc/ssl/certs/${USER}.crt /var/www/html/

# Start nginx
CMD ["nginx", "-g", "daemon off;"]



# The subject information is provided in a format called Distinguished Name (DN).
# openssl -subj "/C=TR/ST=Kocaeli/L=Kocaeli/O=Ecole42/OU=gsever/CN=gsever"
# /C=Country Code/ST=State or Province/L=Locality/O=Organization/OU=Organizational Unit/CN=Common Name
# /C: Country code -> Ülke kodu.
# /ST: State or province -> Eyalet veya il.
# /L: Locality -> Şehir.
# /O: Organization -> Organizasyon.
# /OU: Organizational unit -> Organizasyon birimi.
# /CN: Common Name -> Ortak ad.
# #ssl sertifikası oluşturmaya yarıyor, -x509 -> imzalayıcı fonksiyon
# # -nodes -> gizli anahtarı şifrelemez -days -> belli gün sayısı
# #rsa:2048 -> oluşturan yeni anahtarı rsa 2048 algoritması ile şifreler
# #-keyout -> gizli key konumu -out -> key konumu
# #-subj sertifika imzası
 #-g global değişkeni set eder, deamon off -> ana process haline getirir.