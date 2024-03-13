#!/bin/bash

#File to update master package list in the repository to the packages that are installed on this machine

#Creation Date: 3/6/2024
#Last Updated: 3/6/2024
#Author: Simon Kowerski :)

#Version: 1.0
#Assumes already in the correct directory


read -p "Overwriting existing OSImage with image of this current operating system. Type [y] to continue? " input
if [ "$input" == "y" ]; then
	#sudo chmod 777 completePackage.txt
	sudo chmod 666 installed-packages
	sudo chmod 666 repo-keys
	dpkg --get-selections > installed-packages
	apt-key exportall > repo-keys
	#sudo apt list --installed | awk -F/ -v ORS=" " 'NR>1 {print $1}' > completePackage.txt
	#push changes to github && echo "Image override successful"
else
	echo "Cancelling imaging of Operating System"
fi	


