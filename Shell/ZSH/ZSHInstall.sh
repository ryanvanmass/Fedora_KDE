#!/bin/bash
############### Installs ZSH and Required Plug Ins ###############
sudo yum install -y zsh autojump-zsh zsh-autosuggestions zsh-syntax-highlighting

############### Downloads ZSH Theme Configurator ###############
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /usr/share/powerlevel10k/
gi
############### Downloads Required Fonts ###############
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

############### "Installs" Fonts ###############
sudo cp 'MesloLGS NF Regular.ttf' /usr/share/fonts/
rm 'MesloLGS NF Regular.ttf'

sudo cp 'MesloLGS NF Bold.ttf' /usr/share/fonts
rm 'MesloLGS NF Bold.ttf'

sudo cp 'MesloLGS NF Italic.ttf' /usr/share/fonts
rm 'MesloLGS NF Italic.ttf'

sudo cp 'MesloLGS NF Bold Italic.ttf' /usr/share/fonts
rm 'MesloLGS NF Bold Italic.ttf'

############### Configures Terminal Emulators ###############
# Terminator
mkdir /home/$USER/.config/terminator
cp Shell/ZSH/TermConfig/Terminator.config /home/$USER/.config/terminator/config

# Tilda
mkdir /home/$USER/.config/tilda
cp Shell/ZSH/TermConfig/Tilda.config_0 /home/$USER/.config/tilda/config_0
cp /usr/share/applications/tilda.desktop /home/$USER/.config/autostart/

############### Copys ZSHRC file to User .zshrc ###############
cat Shell/ZSH/zshrc >> /home/$USER/.zshrc

############### Changes defualt Shell to ZSH ###############
sudo usermod -s /bin/zsh $USER

############### Copies Aliasrc file to user Directory ###############
cp Shell/aliasrc /home/$USER/.aliasrc

############### Changes Display Manager from Wayland to X11 ###############
#This Change is made to fix issue with Tilda Keyboard Shortcuts not working
sudo su -c "rm /etc/gdm/custom.conf"
sudo su -c "cp Shell/ZSH/TermConfig/DM.custom.conf /etc/gdm/custom.conf"