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


# openssl req: OpenSSL aracıyla bir sertifika talebi oluşturmayı sağlar.
# -newkey rsa:4096: Yeni bir RSA 4096 bit uzunluğunda anahtar çifti oluşturulmasını belirtir.
# -x509: Kendi kendine imzalanan bir X.509 sertifikası oluşturulacağını belirtir.
# -sha256: Sertifika talebinde kullanılacak özet algoritmasını belirtir (SHA-256).
# -days 365: Sertifikanın geçerlilik süresini belirler (365 gün).
# -nodes: Anahtarın şifrelenmemesini sağlar, yani özel anahtarın şifrelenmemiş olacağını gösterir.
# -out /etc/ssl/certs/gsever.crt: Oluşturulan sertifikanın çıktı dosyasının yolu ve adıdır.
# -keyout /etc/ssl/certs/gsever.key: Oluşturulan özel anahtarın çıktı dosyasının yolu ve adıdır.
# -subj "/C=TR/ST=Kocaeli/L=Istanbul/O=Ecole42/OU=gsever/CN=gsever": Sertifika altında yer
# 	 alacak konu (subject) bilgisini belirtir.
# 	Bu örnek sertifikada Türkiye (TR) ülke kodu, Kocaeli şehir kodu, İstanbul şehir adı,
# 	 Ecole42 organizasyon adı, gsever birim adı ve gsever genel adı (common name) kullanılmıştır.
# 	Bu komutun sonucunda, /etc/ssl/certs/gsever.crt dosyası kendisine ait bir imzalı sertifikayı
# 	 içerecektir ve /etc/ssl/certs/gsever.key dosyası, bu sertifikayı oluşturan özel anahtarı içerecektir.
# 	 Sertifika ve özel anahtar, genellikle sunucu tarafında güvenli iletişim kurmak için kullanılır.

# CMD: Bu komut, Docker konteyneri başlatıldığında çalıştırılacak komutu belirtir.
# 	 Konteyner başlatıldığında bu komut otomatik olarak çalıştırılır.
# ["nginx", "-g", "daemon off;"]: Bu komut, Nginx web sunucusunu başlatmak için kullanılır.
# Parametreler şu şekildedir:

# "nginx": Nginx uygulamasının çalıştırılacağını belirtir. Bu, Docker
# 	 konteyneri içinde çalıştırılacak ana komuttur.
# "-g": Bu parametre, Nginx'e global bir yapılandırma direktifi sağlar.
# "daemon off;": Bu Nginx yapılandırma direktifi, Nginx'in arka planda
# 	 daemon olarak çalışmasını engeller. Bu, konteynerin ön planda
# 	 çalışmasını sağlar ve Docker'in konteyneri sonlandırana kadar
# 	 çalışır durumda kalmasını sağlar.
# Bu Dockerfile, Nginx'i başlatan bir Docker konteyneri oluşturur ve bu
# 	 konteyner, "daemon off;" direktifi sayesinde arka planda değil, ön
# 	 planda çalışarak Docker konteyneri sonlandırılana kadar aktif kalır.
# 	 Bu, genellikle bir web sunucusu gibi sürekli çalışması gereken
# 	 uygulamalar için kullanışlıdır.

# The subject information is provided in a format called Distinguished Name (DN).
# openssl -subj "/C=TR/ST=Kocaeli/L=Kocaeli/O=Ecole42/OU=gsever/CN=gsever"
# /C=Country Code/ST=State or Province/L=Locality/O=Organization/OU=Organizational Unit/CN=Common Name
# /C: Country code -> Ülke kodu.
# /ST: State or province -> Eyalet veya il.
# /L: Locality -> Şehir.
# /O: Organization -> Organizasyon.
# /OU: Organizational unit -> Organizasyon birimi.
# /CN: Common Name -> Ortak ad.

#ssl sertifikası oluşturmaya yarıyor, -x509 -> imzalayıcı fonksiyon
#-nodes -> gizli anahtarı şifrelemez -days -> belli gün sayısı
#rsa:2048 -> oluşturan yeni anahtarı rsa 2048 algoritması ile şifreler
#-keyout -> gizli key konumu -out -> key konumu
#-subj sertifika imzası
#-g global değişkeni set eder, deamon off -> ana process haline getirir.