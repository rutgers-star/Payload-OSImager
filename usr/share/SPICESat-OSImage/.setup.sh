#!/bin/bash

#File to install all required dependencies for Rutgers S.T.A.R. SPICESat

#Creation Date: 3/4/2024
#Last Updated: 3/4/2024
#Author: Simon Kowerski :)

#Version 1.0

#Assumes already in the correct directory

#pull completePackage.txt from github
sudo apt-get install < completePackage.txt

echo "Required Packages installed"
echo "Pulling Python modules"

#pull python stuff and put it at that location
#call pull-python

echo "Python modules pulled from remote. See ~/SPICESat for project structure"
echo "If you wish to make use of the OSImager's automatic code pulling and pushing, leave these files here"
