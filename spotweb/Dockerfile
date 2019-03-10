
FROM erikdevries/spotweb:latest

LABEL maintainer="JR Bing <jr@jrbing.com>" \
      base.image="erikdevries/spotweb:latest" \
      version="1.0" \
      description="Spotweb with postgres support"

RUN set -x && \
    apk add --no-cache --update \
      postgresql-client \
      php7-pdo_pgsql \
    && \
    sed -i "s/;date.timezone =/date.timezone = \"America\/New_York\"/g" /etc/php7/php.ini

COPY ./conf/spotweb /app

COPY rootfs /
