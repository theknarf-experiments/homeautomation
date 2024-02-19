# Setup instructions for Raspberry Pi OS

1. Download `Raspberry Pi OS Lite` from [their webpage](https://www.raspberrypi.org/software/operating-systems/#raspberry-pi-os-32-bit)

2. Unzip the downloaded zip file, you should see an img file and insert an SD card into your computer

3. Follow [this instruction](https://www.raspberrypi.org/documentation/installation/installing-images/mac.md) for flashing you're SD card on MacOS.

4. Reinsert the SD-Card into your computer and create an empty file called "ssh" inside the boot directory to enable ssh.

5. Insert the SD-Card into the raspberry pi, connect power and an ethernet cable.

6. Connect to the Raspberry PI using ssh. The default username is "pi" and the default password is "raspberry".

```
ssh pi@raspberrypi # or use the ip address of the raspeberry pi after the @
```

7. Login as root (`sudo su`).

8. You may want to change the hostname (`sudo raspi-config` and select `System Options -> Hostname`).

9. Install git (`sudo apt install -y git`), and clone this repo to get the setup script.

10. Run the setup script in this folder: `./setup.sh`
    You'll be asked to enter a new username as a part of the process, as well as adding your public key for login.

11. Switch to your new user (`su newusername`), and configure your user.

12. Disconnect from ssh and try and ssh in with your new user.

13. If everything seems okay then delete the default "pi" user:

```
sudo userdel pi
```

12. Reboot:

```
sudo reboot
```

## Installing Docker & docker-compose

Ensure that you have rebooted at least once and run:

```
./setup_docker.sh
```

## Install Snaps and terraform

If you want to use Terraform you can install it using snapd.

```
sudo apt update
sudo apt install snapd
#sudo reboot # You may need to reboot
export PATH=$PATH:/snap/bin # Ensure that snap directory is in your path
sudo snap install terraform --candidate
terraform --version # To verify that it's installed
```
