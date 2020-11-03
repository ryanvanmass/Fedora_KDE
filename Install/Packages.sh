#!/bin/bash
################ Remmina Install ################
sudo dnf install -y epel-release
sudo dnf copr enable -y castor/remmina
sudo dnf install -y  'remmina*'


################ OBS Install ################
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y obs-studio

################ OpenRazer and Polychromatic ################
#OpenRazer
sudo dnf install  -y kernel-devel
sudo dnf config-manager --add-repo https://download.opensuse.org/repositories/hardware:razer/Fedora_33/hardware:razer.repo
sudo dnf install -y openrazer-meta

#Polychromatic
sudo dnf config-manager --add-repo https://download.opensuse.org/repositories/hardware:razer/Fedora_33/hardware:razer.repo
sudo dnf install -y polychromatic

################ Kdenlive Install ################
#Must be after OBS is is installed as it uses the fusion Repo as well
sudo dnf install -y kdenlive

################ VS Code Install ################
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf install -y code

################ Misc Packages ################
sudo dnf install -y htop iotop iftop net-tools openssh-server terminator timeshift nmap flameshot tlp hugo yakuake syncthing 

################ Vivaldi Install ################
wget https://downloads.vivaldi.com/stable/vivaldi-stable-3.2.1967.47-1.x86_64.rpm
sudo yum --nogpgcheck localinstall -y vivaldi-stable-3.2.1967.47-1.x86_64.rpm
rm vivaldi-stable-3.2.1967.47-1.x86_64.rpm

################ RealVNC Viewer Install ################
wget https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-6.20.529-Linux-x64.rpm
sudo yum --nogpgcheck localinstall -y VNC-Viewer-6.20.529-Linux-x64.rpm
rm VNC-Viewer-6.20.529-Linux-x64.rpm

################ OnlyOffice Install ################
wget https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors.x86_64.rpm
sudo yum --nogpgcheck localinstall -y onlyoffice-desktopeditors.x86_64.rpm
rm onlyoffice-desktopeditors.x86_64.rpm

################ Zoom Install ################
wget https://zoom.us/client/latest/zoom_x86_64.rpm
sudo yum --nogpgcheck localinstall -y zoom_x86_64.rpm
rm zoom_x86_64.rpm

############### Installs Joplin ###############
wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash

################ VMWare Workstation Install ################
wget https://download3.vmware.com/software/wkst/file/VMware-Workstation-Full-15.5.6-16341506.x86_64.bundle
sudo sh ./VMware-Workstation-Full-15.5.6-16341506.x86_64.bundle
rm VMware-Workstation-Full-15.5.6-16341506.x86_64.bundle

################ MS Core Fonts Install ################
wget https://sourceforge.net/projects/mscorefonts2/files/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm/download -O msttcore-fonts-installer-2.6-1.noarch.rpm
sudo dnf install msttcore-fonts-installer-2.6-1.noarch.rpm -y
rm msttcore-fonts-installer-2.6-1.noarch.rpm