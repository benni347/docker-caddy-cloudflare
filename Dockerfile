# syntax=docker/dockerfile:1
FROM caddy:2.7.6-builder AS builder
RUN xcaddy build \
  --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6
RUN apk add --no-cache nss-tools
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
