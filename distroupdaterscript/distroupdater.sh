#!/bin/bash

# checks for distro name and version
if [ -f /etc/os-release ]; then
     . /etc/os-release
     echo "Your distro is $NAME version $VERSION"
else
     echo "ERROR: NO DISTRO DETECTED"
     echo "Please make sure your distro is supported by this script."
fi
case $NAME in
"Arch Linux")
echo "Synchronizing your $NAME package databases and updating your packages, You will be asked to authenticate by your password."
sudo pacman -Syu
;;
"Alpine Linux")
echo "Updating and upgrading packages for $NAME, You will be asked to authenticate by your password."
sudo apk update
sudo apk upgrade
;;
"Debian GNU/Linux")
echo "Updating and upgrading packages for $NAME, You will be asked to authenticate by your password."
sudo apt update
sudo apt upgrade
;;
"Ubuntu")
echo "Updating and upgrading packages for $NAME, You will be asked to authenticate by your password."
sudo apt update
sudo apt upgrade
;;
"Linux Mint")
echo "Updating and upgrading packages for $NAME, You will be asked to authenticate by your password."
sudo apt update
sudo apt upgrade
;;
"Pop!_OS")
echo "Updating and upgrading packages for $NAME, You will be asked to authenticate by your password."
sudo apt update
sudo apt upgrade
;;
"Fedora Linux")
echo "Updating and upgrading packages for $NAME, You will be asked to authenticate by your password."
sudo dnf check-update
sudo dnf upgrade
;;
esac
# checks if flatpak or snap is installed and asks user if they want to update these packages too
if command -v flatpak &> /dev/null; then
    echo "Flatpak is installed on this device, would you like to update Flatpak packages too?."
    read -p "[y/n] :" input1
    if [ $input1 == "y" ]; then
    sudo flatpak update 
    fi
else
    echo "Flatpak is not installed."
fi

if command -v snap &> /dev/null; then
    echo "Snap is installed on this device, would you like to update Snap packages too?"
    read -p "[y/n] :" input2
    if [ $input2 == "y" ]; then
    sudo snap refresh 
    fi
else
    echo "Snap is not installed."
fi