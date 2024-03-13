#!/bin/bash

#installs all required packages from the git hub

#Creation Date: 3/6/2024
#Last Updated: 3/13/2024
#Author: Simon Kowerski :)

#Version: 1.0
#Assumes already in the correct directory

echo "Beginning package install"

test git || sudo apt install git
sudo wget https://github.com/rutgers-star/Payload-OSImager/blob/main/usr/share/SPICESat-OSImage/installed-packages
sudo wget https://github.com/rutgers-star/Payload-OSImager/blob/main/usr/share/SPICESat-OSImage/repo-keys

echo "Pulled package lists"


sudo apt-get install dselect
sudo dselect update
sudo apt-get dselect-upgrade
sudo apt-key add repo-keys
sudo dpkg --set-selections < installed-packages
sudo apt-get install < installed-packages
sudo apt-get dselect-upgrade -y

sudo apt update
sudo apt upgrade

echo "All packages installed and up to date"
