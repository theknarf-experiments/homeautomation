#!/bin/bash
# This scripts sets up the hardware watchdog on the raspberry pi
# It should automatically reboot the raspberry pi if it hangs up
#
# Note:
#  I've tried to write the script in an idempotent way so that running it more than once gives it the same result.
#
# Script based on the following article:
# - https://diode.io/raspberry%20pi/running-forever-with-the-raspberry-pi-hardware-watchdog-20202/

# Check if watchog is enabled
grep -Fxe 'dtparam=watchdog=on' /boot/config.txt || {

echo "Enabling the hardware watchdog"
echo "It'll may need to reboot after this to take effect"

sudo tee -a /boot/config.txt > /dev/null <<EOT
# Enabling watchdog.
dtparam=watchdog=on
EOT

}

sudo apt-get update
sudo apt-get install -y watchdog

grep -Fxe '# setup_watchdog.sh' /etc/watchdog.conf || {

sudo tee -a /etc/watchdog.conf > /dev/null <<EOT
# setup_watchdog.sh
watchdog-device = /dev/watchdog
# timeout [sec] until reboot
retry-timeout = 300
# interval [sec] of testing
interval = 15
#max-load-1 = 24
interface = eth0
# an internet or local address to test, for example 192.168.0.1
ping = 8.8.8.8
EOT

}

sudo systemctl enable watchdog

echo "Reboot the device."
echo "After rebooting the command 'systemctl status watchdog' should show it running"
