#!/bin/bash


sudo add-apt-repository ppa:bashtop-monitor/bashtop
sudo add-apt-repository ppa:agornostal/ulauncher 
sudo add-apt-repository ppa:lutris-team/lutris
sudo add-apt-repository ppa:linrunner/tlp
 
 sudo apt update 
 
 # Get DEB files
 wget https://github.com/flavioislima/HeroicGamesLauncher/releases/download/v1.5.5/heroic_1.5.5_amd64.deb
 
#install applications
sudo apt install vim -y
sudo apt install vlc -y
sudo apt install ubuntu-restricted-extras -y
sudo apt install gnome-tweaks -y
sudo apt install firefox-gnome-shell -y
sudo apt install kitty -y
sudo apt install steam -y
sudo apt install timeshift -y
sudo apt install synaptic -y
sudo apt install zathura -y
sudo apt install cargo -y
sudo apt install flameshot -y
sudo apt install python3-pip -y
sudo apt-get install tlp tlp-rdw -y
 sudo apt install bashtop -y
 sudo apt install ulauncher -y
 sudo apt install lutris -y
 sudo apt install nitrogen -y

# Install DEB files
dpkg -i heroic_1.5.5_amd64.deb

#install macchina (alternative to neofetch)
cargo install macchina

sudo tlp start

# Final message
echo All application have been installed, the script will now quit.
# Exit the script
exit 0
