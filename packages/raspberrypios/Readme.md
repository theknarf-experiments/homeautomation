# Setup instructions for Raspberry Pi OS

1. Download `Raspberry Pi OS Lite` from [their webpage](https://www.raspberrypi.org/software/operating-systems/#raspberry-pi-os-32-bit)

2. Unzip the downloaded zip file, you should see an img file

3. Insert an SD card into your computer

4. Follow [this instruction](https://www.raspberrypi.org/documentation/installation/installing-images/mac.md) for flashing you're SD card.

5. Reinsert the SD-Card into your computer and create an empty file called "ssh" inside the boot directory to enable ssh.

6. Connect to the Raspberry PI without internett, that way you can change default password without anyone attacking the raspberry pi.
   The default username is "pi" and the default password is "raspberry".

7. Login as root (`sudo su`).

8. Create a new user (`adduser knarf`), add yourself to sudoer (`visudo`), add ssh keys.

9. Delete the "pi" user (`sudo su` followed by `userdel pi`).

10. Disable password login and ensure root login over ssh is disabled (`sudo vi /etc/ssh/sshd_config`).

11. Install zsh, vim and git (`sudo apt install -y vim git zsh`)

12. Configure your user

13. Change shell to zsh (`chsh -s /bin/zsh`)

14. Run `sudo raspi-config` and set locale settings, ensure that `en_US-utf8` is checked.

## Installing Docker

1. Run:

```
sudo apt update
sudo apt upgrade
```

2. Reboot:

```
sudo reboot
```

3. Follow step 4 from [this instruction](https://www.docker.com/blog/happy-pi-day-docker-raspberry-pi/).

## Install Snaps and terraform

1. Run:

``
sudo apt update
sudo apt install snapd
```

2. Reboot:

```
sudo reboot
```

3. Install terraform:

```
sudo snap install terraform --cnadidate
```
