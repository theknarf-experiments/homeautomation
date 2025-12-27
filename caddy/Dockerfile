# Stage 1 - Building Caddy with digital ocean provider
FROM caddy:2.3.0-builder AS builder

RUN xcaddy build --with github.com/caddy-dns/digitalocean

# Stage 2 - Running Caddy
FROM caddy:2.3.0

RUN apk add nss-tools

ARG DIGITALOCEAN_API_TOKEN
ENV DIGITALOCEAN_API_TOKEN $DIGITALOCEAN_API_TOKEN

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
COPY Caddyfile /etc/caddy/Caddyfile
