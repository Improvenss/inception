FROM	debian:buster

RUN		apt update; \
# apt upgrade -y \
apt install -y nginx openssl

RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048\
			-keyout /etc/ssl/private/nginx.key\
			-out /etc/ssl/certs/nginx.crt\
			-subj "/C=TR/ST=Kocaeli/L=Istanbul/O=Ecole42/OU=gsever/CN=gsever"

COPY	./conf/nginx.conf /etc/nginx/sites-enabled/default

EXPOSE	443

CMD		["nginx", "-g", "daemon off;"]


# The subject information is provided in a format called Distinguished Name (DN).
# openssl -subj "/C=TR/ST=Kocaeli/L=Kocaeli/O=Ecole42/OU=gsever/CN=gsever"
# /C=Country Code/ST=State or Province/L=Locality/O=Organization/OU=Organizational Unit/CN=Common Name
# /C: Country code -> Ülke kodu.
# /ST: State or province -> Eyalet veya il.
# /L: Locality -> Şehir.
# /O: Organization -> Organizasyon.
# /OU: Organizational unit -> Organizasyon birimi.
# /CN: Common Name -> Ortak ad.


# FROM debian:buster

# RUN apt update; \
#     apt install -y nginx openssl

# RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
#     -keyout /etc/ssl/private/nginx.key \
#     -out /etc/ssl/certs/nginx.crt \
#     -subj "/C=TR/ST=Istanbul/L=Istanbul/O=Ecole42/OU=gsever/CN=gsever"
# #ssl sertifikası oluşturmaya yarıyor, -x509 -> imzalayıcı fonksiyon
# # -nodes -> gizli anahtarı şifrelemez -days -> belli gün sayısı
# #rsa:2048 -> oluşturan yeni anahtarı rsa 2048 algoritması ile şifreler
# #-keyout -> gizli key konumu -out -> key konumu
# #-subj sertifika imzası
# COPY ./conf/default etc/nginx/sites-enabled/default
# #https://www.coderrocketfuel.com/article/default-nginx-configuration-file-inside-sites-available-default
# EXPOSE 443
# #bknz pdf
# CMD ["nginx", "-g", "daemon off;"]
# #-g global değişkeni set eder, deamon off -> ana process haline getirir.