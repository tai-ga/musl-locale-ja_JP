FROM alpine:latest

WORKDIR /root
ENV MUSL_LOCALE_DEPS cmake make musl-dev gcc gettext-dev libintl tzdata musl-locales
ENV MUSL_LOCPATH /usr/share/i18n/locales/musl

RUN    apk add --no-cache $MUSL_LOCALE_DEPS \
	&& cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
	&& echo "export CHARSET=UTF-8"    >  /etc/profile.d/locale.sh \
	&& echo "export LANG=ja_JP.UTF-8" >> /etc/profile.d/locale.sh \
	&& echo "export LC_COLLATE=ja_JP" >> /etc/profile.d/locale.sh \
	\
	&& wget https://gitlab.com/rilian-la-te/musl-locales/-/archive/master/musl-locales-master.zip \
	&& unzip musl-locales-master.zip \
	&& rm -f musl-locales-master.zip \
	&& cd musl-locales-master \
	&& echo ""      >> po/LINGUAS \
	&& echo "ja_JP" >> po/LINGUAS \
	&& echo ""      >> musl-po/LOCALES \
	&& echo "ja_JP" >> musl-po/LOCALES

COPY po/ja_JP.po      musl-locales-master/po/ja_JP.po
COPY musl-po/ja_JP.po musl-locales-master/musl-po/ja_JP.po

RUN	   cd musl-locales-master \
	&& cmake -DLOCALE_PROFILE=OFF -D CMAKE_INSTALL_PREFIX:PATH=/usr . && make \
	&& cp musl-po/ja_JP.UTF-8 /usr/share/i18n/locales/musl

CMD ["/bin/sh"]
