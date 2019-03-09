
FROM erikdevries/spotweb:latest

LABEL maintainer="JR Bing <jr@jrbing.com>" \
      base.image="erikdevries/spotweb:latest" \
      version="1.0" \
      description="Spotweb with postgres support"

RUN set -x && \
    apk add --no-cache --update \
      php7-pdo_pgsql
