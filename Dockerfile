FROM alpine:latest
    MAINTAINER John Doe <john@doe.com>

RUN mkdir -p /opt/ft_ping/

RUN apk update && apk upgrade

RUN apk add --no-cache bash make cmake alpine-sdk strace

WORKDIR /opt/quine

ENTRYPOINT tail -f /dev/null
