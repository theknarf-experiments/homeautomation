# Shared drive over samba

1. Mount up a connected external drive to `/ssd`.
[This](https://www.pidramble.com/wiki/benchmarks/external-usb-drives) and [this](https://www.raspberrypi.org/documentation/configuration/external-storage.md) article is helpfull.


2. Give your user ownership over `/ssd`:

```
sudo chown -R $USER:$USER /ssd
```

3. Create an `.env` file:

```
DOCKER_USER=
DOCKER_PASSWORD=
```

4. Start services:

```
docker-compose up -d
```

## Connecting to it on MacOS

1. Open finder

2. In the menu select "Go -> Connect to Server"

3. Write in `smb://raspberrypi`, connect, fill in username and password when prompted
