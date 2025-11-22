FROM caddy:2.10.2-builder AS builder

RUN xcaddy build \
    --with github.com/lucaslorentz/caddy-docker-proxy@v2.10.0 \
    --with github.com/sablierapp/sablier-caddy-plugin@v1.0.1

FROM caddy:2.10.2-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "docker-proxy"]
