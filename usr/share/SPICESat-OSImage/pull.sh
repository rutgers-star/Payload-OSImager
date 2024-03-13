#!/bin/bash

#Pulls the most recent python code and stores it in ~/ 

#Creation Date: 3/11/2024
#Last Updated: 3/11/2024
#Author: Simon Kowerski :)

#Version: 1.0
#Assumes already in the correct directory

dir=$PWD
cd ~
cd SPICESat || (git clone https://github.com/rutgers-star/PayloadSoftware.git && sudo mv PayloadSoftware SPICESat && cd SPICESat)
(git pull && echo "Python modules up to date") || echo "Git not installed. Run osimager --u"
cd $dir
echo "Python modules up to date in ~/SPICESat"
