#!/bin/bash

#Pushes your most recent python code to the GitHub 

#Creation Date: 3/11/2024
#Last Updated: 3/11/2024
#Author: Simon Kowerski :)

#Version: 1.0
#Assumes already in the correct directory

dir=$PWD

if test $# = 0; then
  echo "Must specify commit message. Try again."
  exit 1
  exit
fi

git config --get user.email || osimager --login

(cd ~/SPICESat && git add . && git commit -m "$1" && git push origin main --force && echo "Code successfully pushed to remote") || echo "Commit failed. Read git error message above. If directory does not exist try 'osimager --pull'. It is asking for you to provide git credentials try osimager --login" 
cd $dir

