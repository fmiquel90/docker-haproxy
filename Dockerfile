FROM alpine:3.15
ENV HAPROXY_UID haproxy
ENV HAPROXY_GID haproxy
RUN apk add --no-cache haproxy ca-certificates openssl openssl-dev zlib-dev ca-certificates && \
    mkdir -p /var/lib/haproxy && \
    touch /var/log/haproxy.log && \
    chown "$HAPROXY_UID:$HAPROXY_GID" /var/lib/haproxy && \
    rm -f /var/cache/apk/*
COPY haproxy.cfg /etc/haproxy/haproxy.cfg
CMD ["haproxy", "-f", "/etc/haproxy/haproxy.cfg"]