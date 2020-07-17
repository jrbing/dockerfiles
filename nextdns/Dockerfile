# https://example.com
#
# vim:set et ft=Dockerfile sw=2 ts=2 tw=80:
#
# To build:
#   docker buildx build --platform linux/arm64/v8 -t nextdns-udm:latest .
#
# To run:
#   podman run -d -it --privileged --network dns --restart always  \
#     --name nextdns \
#     -v "/mnt/data/nextdns/:/etc/nextdns/" \
#     -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \
#     --mount type=bind,source=/config/dnsmasq.lease,target=/tmp/dnsmasq.leases \
#     --dns=45.90.28.163 --dns=45.90.30.163 \
#     --hostname nextdns \
#     jrbing/nextdns-udm:latest

#############
#  Builder  #
#############

FROM alpine:latest as builder

LABEL maintainer="JR Bing <jr@jrbing.com>" \
      base.image="alpine:latest" \
      version="1.0"

ENV VERSION=1.7.0

RUN wget -O /tmp/nextdns.tar.gz https://github.com/nextdns/nextdns/releases/download/v${VERSION}/nextdns_${VERSION}_linux_arm64.tar.gz  \
    && mkdir /tmp/nextdns \
    && tar zxf /tmp/nextdns.tar.gz -C /tmp/nextdns

##############
#  Artifact  #
##############

FROM arm64v8/alpine:latest

RUN apk add --no-cache \
      ca-certificates

COPY --from=builder /tmp/nextdns /opt/nextdns

EXPOSE 53/tcp 53/udp

ENTRYPOINT ["/opt/nextdns/nextdns","run", "-config-file", "/etc/nextdns/nextdns.conf"]
