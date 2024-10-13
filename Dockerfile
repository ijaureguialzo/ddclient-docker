ARG ALPINE_VERSION

FROM alpine:${ALPINE_VERSION:-latest}

RUN apk add --update-cache ddclient

CMD ["/usr/bin/ddclient", "-foreground", "&"]
