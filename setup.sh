#!/bin/bash
################ Configuration Options ################
# 1 for Bash or 2 for ZSH
Shell=1

################ System Update ################
sudo dnf update -y

################ Install Packages ################
sh ./Install/Packages.sh
sh ./Install/Flatpak.sh

################ Shell Configuration ################
if [ $Shell = 1 ]
then
	sh ./Shell/Bash/BASHInstall.sh
elif [ $Shell = 2 ]
then
	sh ./Shell/ZSH/ZSHInstall.sh
else
	echo "Error installing Shell Configuration"
	sleep 10
fi

################ Wireguard Install ################
git clone https://www.github.com/ryanvanmass/Wireguard /home/$USER/Documents/Wireguard/

################ Configure FSTAB ################
sudo su -c "cat fstab.txt >> /etc/fstab"
sudo mkdir -p /media/ryan/Local/Olympus /media/ryan/Local/Hades /media/ryan/Local/Labyrinth /media/ryan/Remote/'1.Olympus(Remote)' /media/ryan/Remote/'2.Hades(Remote)' /media/ryan/Remote/'3.Labyrinth(Remote)'
sudo mount -a