#
# vim:set et ft=Dockerfile sw=2 ts=2 tw=80:
#
# To build:
#   docker build -t image-name .

FROM alpine:latest

LABEL maintainer="JR Bing <jr@jrbing.com>" \
      base.image="alpine:latest" \
      version="1.0"

VOLUME /src
VOLUME /dest

# Base Packages
RUN apk -U update && \
    apk -U upgrade && \
    apk -U add --no-cache \
        bash \
        rsync

CMD rsync -apvH /srcd/ /dest/
