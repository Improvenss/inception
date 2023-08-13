# @link: https://themes.gohugo.io/themes/terminalcv/
# @note: Beautiful terminal theme.
# @git: git clone https://github.com/4s3ti/terminalcv.git themes/terminalcv


FROM alpine:3.15

WORKDIR /var/hugo/static

RUN	apk update \
	&& apk upgrade \
	&& apk add --update --no-cache \
	hugo \
	git \
	shadow \
	&& rm -f /var/cache/apk/*

# create new hugo site
RUN hugo new site /var/hugo/static \
	&& cd /var/hugo/static \
	&& git clone https://github.com/vaga/hugo-theme-m10c themes/m10c \
	&& hugo new posts/presentation.md \
	&& hugo -b https://gsever.42.fr/static \
	&& mkdir -p /var/hugo/me/content/about

# RUN	hugo new site /var/hugo/terminalcv \
# 	&& cd /var/hugo/terminalcv \
# 	&& git clone https://github.com/4s3ti/terminalcv.git themes/terminalcv \
# 	&& hugo new posts/presentation.md \
# 	&& hugo -b https://gsever.42.fr/terminalcv

COPY ./conf/config.toml /var/hugo/static/config.toml
COPY conf/presentation.md /var/hugo/static/content/posts/presentation.md
COPY conf/about.md /var/hugo/static/content/about/index.md
COPY conf/avatar.jpg /var/hugo/static/themes/m10c/static/avatar.jpg
COPY conf/42fitness.jpg /var/hugo/static/themes/m10c/static/42fitness.jpg

EXPOSE 1313

CMD	["hugo", "server", \
	"--bind=0.0.0.0", \
	"--baseURL=https://gsever.42.fr/static", \
	"-p", "1313", \
	"--logFile=/dev/stdout", \
	"--appendPort=false"]

# Bu, Dockerfile adı verilen bir Docker imajı oluşturma talimatlarını
# 	belirten bir dosyadır. İmaj, Alpine Linux sürüm 3.15 tabanlıdır
# 	ve m10c teması ile bir Hugo statik sitesini kurar.

# Dockerfile'ın her bir bölümünün ne yaptığına dair bir ayrıntı:

# - `FROM alpine:3.15`: Bu satır, Docker imajının temel imajını
# belirtir; Alpine Linux sürüm 3.15.
# - `WORKDIR /var/hugo/static`: Bu satır, Dockerfile'daki diğer
# talimatlar için çalışma dizinini `/var/hugo/static` olarak ayarlar.
# - `RUN apk update && apk upgrade && apk add --update --no-cache
# hugo git shadow && rm -f /var/cache/apk/*`: Bu satır, paket dizinini
# günceller, yüklü paketleri yükseltir ve `hugo`, `git` ve `shadow`
# paketlerini kurar. Ayrıca, imajın boyutunu azaltmak için önbelleğe
# alınmış paket dosyalarını kaldırır.
# - `RUN hugo new site /var/hugo/static && cd /var/hugo/static && git
# clone https://github.com/vaga/hugo-theme-m10c themes/m10c && hugo
# new posts/presentation.md && hugo -b https://gsever.42.fr/static
# && mkdir -p /var/hugo/me/content/about`: Bu satır, `/var/hugo/static`
# adresinde yeni bir Hugo sitesi oluşturur, m10c temasını `themes`
# dizinine klonlar, `presentation.md` adlı yeni bir yazı oluşturur,
# `https://gsever.42.fr/static` temel URL'si ile siteyi oluşturur ve
# `/var/hugo/me/content` altında bir `about` dizini oluşturur.
# - `COPY ./conf/config.toml /var/hugo/static/config.toml`: Bu satır,
# ana makineden `./conf/config.toml` dosyasını imajdaki
# `/var/hugo/static/config.toml` adresine kopyalar.
# - `COPY conf/presentation.md /var/hugo/static/content/posts/presentation.md`:
# Bu satır, ana makineden `conf/presentation.md` dosyasını imajdaki
# `/var/hugo/static/content/posts/presentation.md` adresine kopyalar.
# - `COPY conf/about.md /var/hugo/static/content/about/index.md`:
# Bu satır, ana makineden `conf/about.md` dosyasını imajdaki
# `/var/hugo/static/content/about/index.md` adresine kopyalar.
# - `COPY conf/avatar.jpg /var/hugo/static/themes/m10c/static/avatar.jpg`:
# Bu satır, ana makineden `conf/avatar.jpg` dosyasını imajdaki
# `/var/hugo/static/themes/m10c/static/avatar.jpg` adresine kopyalar.
# - `COPY conf/42fitness.jpg /var/hugo/static/themes/m10c/static/42fitness.jpg`:
# Bu satır, ana makineden `conf/42fitness.jpg` dosyasını imajdaki
# `/var/hugo/static/themes/m10c/static/42fitness.jpg` adresine kopyalar.
# - `EXPOSE 1313`: Bu satır, konteyner tarafından 1313 numaralı
# portun açılmasını belirtir.
# - `CMD ["hugo", "server", "--bind=0.0.0.0", "--baseURL=https://gsever.42.fr/static",
# "-p", "1313", "--logFile=/dev/stdout", "--appendPort=false"]`: Bu satır,
# bu imajdan bir konteyner çalıştığında, tüm ağ arayüzlerine bağlı bir Hugo
# sunucusu başlatılacağını belirtir; temel URL'si `https://gsever.42.fr/static`,
# 1313 numaralı porta dinleyerek, stdout'a kaydederek ve URL'lere
# port numarasını eklemeyerek.
