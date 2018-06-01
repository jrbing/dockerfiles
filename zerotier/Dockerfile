#
# To run:
#   docker run --rm \
#     -it \
#     --net=host \
#     -e NETWORK=NETWORKID \
#     --cap-add=NET_ADMIN \
#     --cap-add=SYS_ADMIN \
#     --device=/dev/net/tun \
#     -v /var/lib/zerotier-one:/var/lib/zerotier-one \
#     zerotier

FROM alpine:3.7

LABEL maintainer="JR Bing <jr@jrbing.com>" \
      base.image="alpine:3.7" \
      version="1.0" \
      description="Containerized ZeroTier One to allow connectivity to Kubernetes clusters"

ENV NETWORK=8056c2e21c000001

VOLUME ["/var/lib/zerotier-one"]

RUN set -x && \
    apk add --no-cache --update \
      --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
      zerotier-one && \
    apk add --no-cache --update \
      bash \
      dumb-init

COPY docker-entrypoint.sh /

#CMD ["/docker-entrypoint.sh"]
#ENTRYPOINT ["/bin/sh", "-c", "/main.sh"]
ENTRYPOINT ["/usr/bin/dumb-init", "/docker-entrypoint.sh"]
