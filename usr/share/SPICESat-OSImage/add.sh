#!/bin/bash

#Adds a new package to this OS and the external list

#Creation Date: 3/6/2024
#Last Updated: 3/16/2024
#Author: Simon Kowerski :)

#Version: 1.1.0
#Assumes already in the correct directory

echo "Adding new package"
#make sure to pull completePackage.txt

var="pip"
if [ $1 = $var ]; then 
sudo python3 -m pip install $2

else
sudo apt-get install $1 
fi

echo "Complete"

osimager --i

