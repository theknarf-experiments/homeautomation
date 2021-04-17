# IoT setup

Ensure that Docker and docker-compose is installer on the Raspberry Pi.

1. Add your user to the `dialout` group to allow access to serial devices:

```
sudo usermod -a -G dialout $USER
```

2. Run `sudo raspi-config` and enable serial devices then reboot `sudo reboot`.
   After reboot verify that the device /dev/ttyS0 exists by running `ls -la /dev/ttyS0`.

3. Check settings in `docker-compose.yml`

4. Start it:

```
./setup.sh
docker-compose up -d
```

5. Browse your device

## Configure node-red

1. Navigate to deconz -> Settings -> Gateway -> Advanced and click `Authenticate app`

2. Then run:

```
docker-compose exec node-red curl -X POST --data '{devicetype:Node-red}' http://iot_deconz_1.iot_default/api
```

3. Navigate to Node-red, create a `deCONZ` -> `in`-node.

4. Double click the node -> Server -> Add new deconz-server

5. Fill out the following:

```
Name: deconz
IP-Address: deconz.rpi3
Port: 80
API Key: # the key your got from step 2
WebSocket Port: 443
```


- [Getting API token from deconz](https://dresden-elektronik.github.io/deconz-rest-doc/getting_started/)

- [Node-red deCONZ plugin](https://github.com/deconz-community/node-red-contrib-deconz)

## Other guides

- [Backup and restore instructions](https://flemmingss.com/how-to-backup-and-restore-deconz-from-a-defective-installation/)

- [Network lost and configuration restore does not help](https://github.com/dresden-elektronik/deconz-rest-plugin/wiki/Network-lost-and-configuration-restore-does-not-help)

- [Zigbee Error Codes in the Log](https://github.com/dresden-elektronik/deconz-rest-plugin/wiki/Zigbee-Error-Codes-in-the-Log)

