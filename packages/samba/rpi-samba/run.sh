#!/bin/bash
set -e

# Ensure that the default user have correct PUID and PGID
PUID=${PUID:-911}
PGID=${PGID:-911}
groupmod -o -g "$PGID" abc
usermod -o -u "$PUID" abc

# For debugging share perimissings and default user permissions
#ls -n /shared
#ls -n /shared/ssd
#echo "User abc UID: $(id -u abc)"
#echo "User abc GID: $(id -g abc)"

test -z "$SAMBA_PASSWORD" && echo "Missing samba password"

# Give default user (abc) access to smb with password
#printf "${SAMBA_PASSWORD}\n${SAMBA_PASSWORD}\n" | smbpasswd -a -s -c /config/smb.conf abc

# New user
useradd -g "$PGID" knarf
printf "${SAMBA_PASSWORD}\n${SAMBA_PASSWORD}\n" | smbpasswd -a -s -c /config/smb.conf knarf

#exec ionice -c 3 smbd -FS --configfile="/config/smb.conf" </dev/null
smbd --foreground --no-process-group --log-stdout --configfile /config/smb.conf
