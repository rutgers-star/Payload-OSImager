#!/bin/bash

#Removes a new package from this OS and the external list

#Creation Date: 3/6/2024
#Last Updated: 3/16/2024
#Author: Simon Kowerski :)

#Version: 1.1.0
#Assumes already in the correct directory

echo "Removing package"
#make sure to pull completePackage.txt

var="pip"
if [ $1 = $var ]; then 
sudo python3 -m pip uninstall $2

else
sudo apt remove $1
fi

echo "Complete"

osimager --i

