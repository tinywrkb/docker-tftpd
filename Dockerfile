FROM docker.io/alpine:latest

RUN \
  wget \
    https://github.com/just-containers/s6-overlay/releases/latest/download/s6-overlay-amd64.tar.gz \
    -O - | \
    tar -xz -C /

RUN \
  apk add --no-cache \
    tftp-hpa

ADD root/ /

VOLUME /config
VOLUME /data

ENTRYPOINT ["/init"]
