#!/bin/bash

# Set locale to english with utf-8
locale=en_US.UTF-8
sudo raspi-config nonint do_change_locale $locale

# Disable serial console
sudo raspi-config nonint do_serial 1

# Ensure that api packages is updated
sudo apt update
sudo apt upgrade

# Install stuff we want
sudo apt install -y \
	vim \
	git \
	zsh \
	tmux \
	tree

# Check to see if your user exist
echo "What username do you use / want to use?"
read -p "Username: " WANT_USERNAME

if id "$WANT_USERNAME" &>/dev/null; then
	echo "User exists. All good."
else
	echo "User with username $WANT_USERNAME does not exist"
	echo "Creating user and adding him to sudoer"

	sudo adduser $WANT_USERNAME
	sudo usermod -aG sudo $WANT_USERNAME

	#Instead of add the user to the sudo group I could just modify /etc/sudoers directly
	#sudo sh -c "echo \"$WANT_USERNAME	ALL=(ALL:ALL) ALL\" >> /etc/sudoers"

	echo "Chaning users shell to zsh"
	sudo chsh --shell /bin/zsh $WANT_USERNAME

	echo "Creating home folder and .ssh folder"
	sudo mkdir -p "/home/$WANT_USERNAME/.ssh"
	sudo chmod 800 /home/$WANT_USERNAME/.ssh
	sudo touch /home/$WANT_USERNAME/.ssh/authorized_keys
	sudo sh -c "echo \"# Add your public key here that you want to use for login\" >> /home/$WANT_USERNAME/.ssh/authorized_keys"
	sudo chmod 644 /home/$WANT_USERNAME/.ssh/authorized_keys

	echo "Add your public key for login purposes"
	sudo vim /home/$WANT_USERNAME/.ssh/authorized_keys

	# Disable password authentication
	# Taken from: https://gist.github.com/parente/0227cfbbd8de1ce8ad05
	sudo grep -q "ChallengeResponseAuthentication" /etc/ssh/sshd_config && sed -i "/^[^#]*ChallengeResponseAuthentication[[:space:]]yes.*/c\ChallengeResponseAuthentication no" /etc/ssh/sshd_config || echo "ChallengeResponseAuthentication no" >> /etc/ssh/sshd_config
	sudo grep -q "^[^#]*PasswordAuthentication" /etc/ssh/sshd_config && sed -i "/^[^#]*PasswordAuthentication[[:space:]]yes/c\PasswordAuthentication no" /etc/ssh/sshd_config || echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
	sudo service ssh restart

	# User ssh keys
	echo "Setting up ssh keys for user"
	sudo ssh-keygen -t rsa -b 4096 -N '' -f /home/$WANT_USERNAME/.ssh/id_rsa
	sudo chmod 600 /home/$WANT_USERNAME/.ssh/id_rsa
	sudo chmod 644 /home/$WANT_USERNAME/.ssh/id_rsa.pub

	# Ensure that the user owns all the files in his homedirectory
	sudo chown -R $WANT_USERNAME:$WANT_USERNAME /home/$WANT_USERNAME
fi

if [ -d "/home/$WANT_USERNAME/config" ]
then
	echo "Cloning and setting up theknarf/configs dotfile setup from https://github.com/theknarf/configs"
	read -p "Type 'y' to proceed:" -n 1 -r
	
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		git clone https://github.com/TheKnarf/configs.git /home/$WANT_USERNAME/configs		
		cd /home/$WANT_USERNAME/configs	&& git pull
		cd /home/$WANT_USERNAME/configs	&& git remote set-url origin git@github.com:TheKnarf/configs.git
		sudo chown -R $WANT_USERNAME:$WANT_USERNAME /home/$WANT_USERNAME/configs
	fi
else
	echo "Config folder exists"
fi

# Double check that your personal user is created
if id "$WANT_USERNAME" &>/dev/null; then
	echo "Everything should be good." 
else
	echo "Something went wrong with creating your user $WANT_USERNAME"
	echo "Try to make the user yourself manually ('sudo adduser $WANT_USERNAME')"
fi
