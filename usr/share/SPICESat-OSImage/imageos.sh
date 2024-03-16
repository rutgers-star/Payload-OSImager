#!/bin/bash

#File to update master package list in the repository to the packages that are installed on this machine

#Creation Date: 3/6/2024
#Last Updated: 3/16/2024
#Author: Simon Kowerski :)

#Version: 1.1.0
#Assumes already in the correct directory

sudo touch python-requirements

read -p "Overwriting existing OSImage with image of this current operating system. Type [y] to continue? " input
if [ "$input" == "y" ]; then
	git config --get user.email || osimager --login
	#sudo chmod 777 completePackage.txt
	sudo chmod 666 installed-packages
	sudo chmod 666 repo-keys
	sudo chmod 666 python-requirements

	dpkg --get-selections > installed-packages
	apt-key exportall > repo-keys
	sudo python3 -m pip freeze > python-requirements
	
	sudo git clone https://github.com/rutgers-star/Payload-OSImager.git
	sudo find Payload-OSImager -type d -exec chmod 777 {} \;
	sudo find Payload-OSImager -type f -exec chmod 777 {} \;
	
	git config --global --add safe.directory $PWD/Payload-OSImager	
	
	sudo rm Payload-OSImager/usr/share/SPICESat-OSImage/installed-packages
	sudo rm Payload-OSImager/usr/share/SPICESat-OSImage/repo-keys
	sudo rm Payload-OSImager/usr/share/SPICESat-OSImage/python-requirements
	
	sudo cp installed-packages Payload-OSImager/usr/share/SPICESat-OSImage/installed-packages
	sudo cp repo-keys Payload-OSImager/usr/share/SPICESat-OSImage/repo-keys
	sudo cp python-requirements Payload-OSImager/usr/share/SPICESat-OSImage/python-requirements
	
	cd Payload-OSImager
	git add .
	git commit -m "Update package lists"
	git push origin main
	cd ..
	sudo rm -r Payload-OSImager
else
	echo "Cancelling imaging of Operating System"
fi	


