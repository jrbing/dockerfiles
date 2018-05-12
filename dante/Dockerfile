FROM alpine:3.7

LABEL maintainer="JR Bing <jr@jrbing.com>" \
      base.image="alpine:3.7" \
      version="1.0"

ENV DANTE_VERSION=1.4.2 \
    USERNAME=admin \
    PASSWORD=admin

RUN set -x \
    && apk add --no-cache \
      linux-pam \
      tini \
    && apk add --no-cache -t .build-deps \
      build-base \
      curl \
      linux-pam-dev \
    && cd /tmp \
    && curl -L https://www.inet.no/dante/files/dante-${DANTE_VERSION}.tar.gz | tar xz \
    && cd dante-* \
    && ac_cv_func_sched_setscheduler=no ./configure \
    && make install \
    && cd / \
    && adduser -S -D -u 8062 -H sockd \
    && rm -rf /tmp/* \
    && apk del --purge .build-deps

COPY sockd.conf /etc/

COPY docker-entrypoint.sh /

EXPOSE 1080

ENTRYPOINT ["/sbin/tini", "--", "/docker-entrypoint.sh"]
