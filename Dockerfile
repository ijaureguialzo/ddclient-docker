ARG ALPINE_VERSION

FROM alpine:${ALPINE_VERSION:-latest}

RUN apk add --update-cache ddclient

RUN apk --no-cache add shadow && \
    groupmod --gid 1000 ddclient && \
    usermod -u 1000 ddclient && \
    apk del shadow

RUN chown -R ddclient:ddclient /var/cache/ddclient

USER ddclient

CMD ["/usr/bin/ddclient", "-foreground", "&"]
