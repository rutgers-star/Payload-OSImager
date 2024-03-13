#!/bin/bash

#installs all required packages from the git hub

#Creation Date: 3/6/2024
#Last Updated: 3/7/2024
#Author: Simon Kowerski :)

#Version: 1.0
#Assumes already in the correct directory
#Assumes git is already installed

echo "Beginning package install"
#make sure to pull completePackage.txt
#sudo apt-get install < completePackage.txt
#sudo apt install < completePackage.txt

#git
test git || sudo apt install git
#set up stuff
#pull files


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
