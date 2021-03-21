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
docker-compose pull
docker-compose up -d
```

5. Open the ip of your raspberry pi in your browser and setup IoT devices

## Backup and restore instructions

https://flemmingss.com/how-to-backup-and-restore-deconz-from-a-defective-installation/
