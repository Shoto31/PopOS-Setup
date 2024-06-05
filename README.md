# Index

## [Post Installation](#1-post-installation)
- **[Update your System](#update-your-system)**
- **[System Tweaks](#system-tweaks)**

## [Preferred Apps](#2-preferred-apps)
- **[Browser](#browser) -> [Firefox](#1-firefox)**
- **[Video Tools](#video-tools) -> [VLC](#1-vlc)**
- **[Office](#office) -> [Libre Office](#1-libreoffice)**
- **[Programming Apps](#programming-apps) -> [Vim](#1-vim), [VSCode](#2-vscode)**
 , [Multimedia Codecs](#3-multimedia-codecs), [Lutris](#4-lutris)**
- **[Other Apps](#other-apps) ->  [Synaptic](#1-synaptic-package-manager), [Nautilus](#2-nautilus-admin-mode), [Timeshift](#3-timeshift), [Firewall](#4-firewall),[Steam](#5-steam-for-gaming)**
- **[Debloat](#--debloat)**

## [Optimize Boot-time & Ram Usage](#3-optimize-boot-time--ram-usage)
- **[Disabling Plymouth](#disabling-plymouth)**
- **[Adjusting the Swappiness Property](#adjusting-the-swappiness-property)**
- **[Adjusting the Cache Pressure](#adjusting--the-cache-pressure-setting)**
- **[Disable Pop Shop on boot](#disabling-pop-shop-on-boot)**
- **[Clearing buff/cache](#clearing-buffcache)**
- **[Optimizing the boot](#optimizing-the-boot)**
- **[Removing Custom Kernel](#getting-rid-of-custom-kernel)**
- **[Final Boot-Time](#final-boot-time)**


## [Inspiration](#Inspiration)

## 1. Post Installation
These are some of the things I do after a fresh install of PopOs.

### Update the system

Since I mainly update my system through the terminal, i use these commands:
```bash
sudo apt update && sudo apt upgrade -y 
```

### System Tweaks 
```bash
sudo apt install gnome-tweaks -y  # This is mainly to restore the min and max buttons change they're orientation and later customize gnome.
``` 

```bash
sudo apt install ubuntu-restricted-extras -y #Gives you the ability to play popular non-free media formats, including DVD, MP3, Quicktime and Windows Media.
``` 

```bash
gsettings set org.gnome.desktop.privacy remember-app-usage false #Disable Frequents Tab in Gnome app menu. This option is not required for Gnome > 3.38.

```

## 2. Apps that I install on any machine

### Browser
#### 1. [Firefox](https://www.mozilla.org/en-US/firefox/new/) - By default Firefox comes pre installed in any of the distros I tried so you don't need to install anything. <br />
The Browser that I use in any of my setups is always Firefox, and it's an amazing browser, it helps that I am currently trying to take anything related to Google out of my setups. <br />


### Video Tools
#### 1. [VLC](https://www.videolan.org/index.html)

```bash
sudo apt install vlc  -y #VLC is the best video player for any platform
```
```bash
sudo apt-get autoremove --purge totem* -y #Get rid of the stock video player
```

### Office Suite 
I don't really install any office suite on my machines since I use the online google docs and google sheets. But normally LibreOffice come preinstalled 
<br /> <br />


### Programming Apps
#### 1. Vim
```bash
sudo apt install vim
```
#### 2. VSCode
Since I'm in PopOS I just go to the VSCode website and download the .deb file from there.



### Other Apps
#### 1. Synaptic Package manager
 
```bash
sudo apt install synaptic -y #serves as a graphical front-end to APT which makes the process of software management easier.
```
#### 2. Nautilus (admin mode)

```bash
sudo apt install nautilus-admin -y && nautilus -q #Adds right-click property *Open as Administrator*
```
#### 3. Timeshift

```bash
sudo apt install timeshift -y #System restore tool for Linux in case anything goes wrong.
```
#### 4. Firewall
GUFW is a graphical utility for managing Uncomplicated Firewall (UFW). This is pretty easy to use appication with bunch of settings which you can set according to your preference.
```bash
sudo apt install gufw # Graphical utility for managing Uncomplicated Firewall (UFW).Pretty easy to setup 
```
#### 5. Steam for Gaming
```bash
sudo apt install steam -y
```
If it doesn't work, turn on multiverse.
```bash
sudo add-apt-repository multiverse && sudo apt update
```

I also use [Glorious Eggroll] (https://github.com/GloriousEggroll/proton-ge-custom) build of proton.

## Debloat
###### Remove useless stuff that you do not need.  Please, read what it does before you remove them.

- **Calendar** - I put this on a list because I never need the Calendar on desktop
```bash
sudo apt autoremove --purge gnome-calendar -y
```
- **Character Map** - is a Unicode character map that allows you to select characters from a table and insert them into a text string. I have no known use for it.
```bash
sudo apt-get autoremove --purge gucharmap* -y
```
- **Contacts** - Gnome contacts tool important for a work pc.
```bash
sudo apt-get autoremove --purge gnome-contacts* -y
```
- **Document Scanner** - Important tool for a work pc.
```bash
sudo apt-get remove --purge sane* simple-scan -y
```
- **Gnome Fonts** - shows you the fonts installed on your computer for your use as thumbnails. Selecting any thumbnails shows the full view of how the font would look under various sizes.
```bash
sudo apt remove --purge gnome-font-viewer -y
```
- **Gnome Help** - Useful for newcomers
```bash
sudo apt-get autoremove --purge yelp* -y
```
- **Gnome Power Manager** - can show historical and current battery information and programs waking up that use power. I never use it.
```bash
sudo apt remove --purge gnome-power-manager -y
```

#### Reverting
If you accidentally remove any, you can add them back by
```bash
sudo apt install <appname> -y
```
*App name doesn't require * symbol*

## 3. Optimize Boot-time & Ram Usage

My original boot-time was around 2min after removing apps it's now 42sec.<br /> <br />

### Disabling Plymouth
**For Pop OS** <br />
```bash
sudo kernelstub --delete-options "quiet systemd.show_status=false splash"
```
### Adjusting the Swappiness Property
This is required to adjust swap usage. If you have huge rams like 16GB ram then you can reduce this value to as low as 0. But if you have low ram devices like 1GB you should make this 90 or higher. Interactions with the swap file are costlier since swaps are slower than RAMs and they can cause a reduction in performance. <br />

Values according to me for Ram: Ratio should be as follows, 32:0, 16:10, 8:20, 4:50, 2:70 <br />
**20 is just an example value, don't mindlessly use it** <br />
```bash
sudo sysctl vm.swappiness=20
```
**These values do not stick. To add them permanently. Add the above line to sysctl.conf.** <br />
```bash
sudo nano /etc/sysctl.conf
```

### Adjusting  the Cache Pressure Setting
Another issue, the system stores cache about stuff that you frequently open & this makes the system faster, as if it opens again, rather than reloading the data it will use the cache. But, on a lower ram device, this is a bad option since this will seriously slow your system down. <br />
Adjust this like you adjusted swappiness property, values for RAM: Pressure should be as follows, 1:100, 2:90, 4:80, 8:60, 16:50.
```bash
sudo sysctl vm.vfs_cache_pressure=50
```
**Add the above line to sysctl.conf.** <br />
```bash
sudo nano /etc/sysctl.conf
```
### Disabling Pop Shop on Boot
Pop Shop always opens on the startup of the system there is a way to stop that. This also helps in saving some ram. <br /> <br />
**Steps:**
1. Edit App center daemon from opening it at start
```bash
sudo nano /usr/share/applications/io.elementary.appcenter-daemon.desktop
```
2. Put # here before this line
```bash
Exec=io.elemantry.appcenter -s
```
### Clearing buff/cache
The computer accumulates high buff/cache over time and makes the user force reboot. To clear buff cache, you can use this. <br />
```bash
free -h && sudo sysctl -w vm.drop_caches=3 && sudo sync && echo 3 | sudo tee /proc/sys/vm/drop_caches && free -h
```
### Optimizing the boot
#### DISCLAIMER
##### PLEASE DO THIS AT YOUR OWN RISK. WHILE THIS IS SAFE TO DO YOU CAN STILL MESS UP YOUR SYSTEM SO, PLEASE READ THIS CAREFULLY AND UNDERSTAND EVERYTHING BEFORE YOU PROCEED.
- **Network-dispatcher** is a dispatcher daemon for systemd-networkd connection status changes.
```bash
sudo apt remove --purge networkd-dispatcher -y
```
- **ModemManager** is a DBus-activated daemon that controls mobile broadband (2G/3G/4G) interfaces. If you do not have a mobile broadband interface, you do not need this.
```bash
sudo systemctl disable ModemManager.service
sudo systemctl mask ModemManager.service
```
**Note:** - If you are not using this and don't want Wi-Fi to disable wpa_supplicant.service.
- **fwupd** is a simple daemon allowing you to update some devices' firmware, including UEFI for several machines
Disable thunderbolt_power <br />
```bash
sudo nano /etc/fwupd/daemon.conf
```
Make it
```bash
BlacklistPlugins=test;invalid;thunderbolt_power
```
-[blacklist_thunderbold](https://github.com/themagicalmammal/howtopopbuntu/blob/master/References/blacklist_thunderbold.png)
Remove fwupd from boot
```bash
sudo systemctl disable fwupd.service
sudo systemctl mask fwupd.service
```
- **Avahi-daemon** is supposed to provide zero-configuration network discovery and make it super-easy to find printers and other hosts on your network. I always disable it and do not miss it.
```bash
sudo systemctl disable avahi-daemon.service
sudo systemctl mask avahi-daemon.service
```
- **Apport** collects potentially sensitive data, such as core dumps, stack traces, and log files. They can contain passwords, credit card numbers, serial numbers, and other private material.
```bash
sudo systemctl disable apport.service
sudo systemctl mask apport.service
```
- **Saned** is the SANE (Scanner Access Now Easy) daemon that allows remote
clients to access image acquisition devices available on the localhost.
```bash
sudo systemctl disable saned.service
sudo systemctl mask saned.service
```
- **GPU-Manager** is software that creates a xorg.conf for you. So running this in every boot is just overkill. You only need to run this if you change your GPU.
```bash
sudo systemctl disable gpu-manager.service
sudo systemctl mask gpu-manager.service
```
- **Apt-daily-upgrade** solves long boot up time with apt-daily-upgrade.
```bash
sudo systemctl disable apt-daily.service
sudo systemctl disable apt-daily.timer
sudo systemctl disable apt-daily-upgrade.timer
sudo systemctl disable apt-daily-upgrade.service
```
- **lvm2-monitor** Only useful if you are using lvm.
```bash
sudo systemctl disable lvm2-monitor.service
sudo systemctl mask lvm2-monitor.service
```
- **Systemd-resolved** [Restart Required]  is a system service that provides network name resolution to local applications. It implements a caching and validating DNS/DNSSEC stub resolver.
1. Disable & Mask the systemd-resolved service
```bash
sudo systemctl stop systemd-resolved.service
sudo systemctl disable systemd-resolved.service
sudo systemctl mask systemd-resolved.service
```
2. Then put dns=default in the [main] section of
```bash
sudo nano /etc/NetworkManager/NetworkManager.conf
```
3. Delete the symlink /etc/resolv.conf
```bash
sudo rm /etc/resolv.conf
```
4. Restart <br /> <br />

**Enable them back** <br />
Let the service name be xyz.service
```bash
sudo systemctl unmask xyz.service
sudo systemctl enable xyz.service
```


## Inspiration
I decided to do this as a guide mainly for myself,  since I always forget some tweaks, extensions or applications, but my inspiracion was [The Magical Mammal/How to popbuntu] (https://github.com/themagicalmammal/howtopopbuntu#6-resource-monitor) you can check his for a more detailed guide.
