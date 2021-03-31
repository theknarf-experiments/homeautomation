# Traefik

Reverse proxy, needs to be staretd before other `packages` in this project.

```
docker-compose up -d
```

## Expose a service over traefik

First of all add the following to the bottom of your `docker-compose.yml`:

```
networks:
  traefik:
    external:
      name: traefik_network
```

This allows that set of docker services to connect to the docker network that we create in the traefik `docker-compose.yml`.

Then for each service that you want to expose add the following:

```
    labels:
      - "traefik.enable=true"
      - "traefik.docker.network=traefik_network"
      - "traefik.http.routers.servicename.rule=Host(`servicename.localhost`)"
      - "traefik.servicename.port=8096"
    networks:
      - traefik
      - default
```

Where `servicename` is the named of the service. Remember to both update the host and port.
