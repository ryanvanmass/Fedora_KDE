#!/bin/bash
################ Install Required Font ################
sudo dnf install -y powerline-fonts

################ Copy Appearnce Configuration to Bashrc file ################
cat Shell/Bash/BashStyle.txt >> /home/$USER/.bashrc

################ Load alias's ################
echo "source ~/.aliasrc" >> ~/.bashrc

################ Copies Alias File to user Home DIR ################
cp Shell/aliasrc /home/$USER/.aliasrc

############### Configures Terminal Emulators ###############
# Terminator
mkdir /home/$USER/.config/terminator
cp Shell/Bash/TermConfig/Terminator.config /home/$USER/.config/terminator/config

# Tilda
mkdir /home/$USER/.config/tilda
cp Shell/Bash/TermConfig/Tilda.config_0 /home/$USER/.config/tilda/config_0
cp /usr/share/applications/tilda.desktop /home/$USER/.config/autostart/

############### Changes Display Manager from Wayland to X11 ###############
#This Change is made to fix issue with Tilda Keyboard Shortcuts not working
sudo su -c "rm /etc/gdm/custom.conf"
sudo su -c "cp Shell/ZSH/TermConfig/DM.custom.conf /etc/gdm/custom.conf"