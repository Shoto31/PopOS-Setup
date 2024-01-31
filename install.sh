#!/bin/bash
sudo add-apt-repository ppa:lutris-team/lutris
sudo apt update  

# Get DEB files
wget https://github.com/flavioislima/HeroicGamesLauncher/releases/download/v1.5.5/heroic_1.5.5_amd64.deb
 
#install applications
sudo apt install vim -y
sudo apt install vlc -y
sudo apt install ubuntu-restricted-extras -y
sudo apt install gnome-tweaks -y
sudo apt install firefox-gnome-shell -y
sudo apt install alacritty -y
sudo apt install steam -y
sudo apt install timeshift -y
sudo apt install synaptic -y
sudo apt install zathura -y
sudo apt install flameshot -y
sudo apt install python3-pip -y
sudo apt install ulauncher -y
sudo apt install lutris -y
#Install Cargo 
curl https://sh.rustup.rs -sSf | sh


# Install DEB files
dpkg -i heroic_1.5.5_amd64.deb

#install macchina (alternative to neofetch)
cargo install macchina

# Final message
echo All application have been installed, the script will now quit.
# Exit the script
exit 0
