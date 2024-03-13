#!/bin/bash

#Removes user's GitHub login credentials

#Creation Date: 3/11/2024
#Last Updated: 3/11/2024
#Author: Simon Kowerski :)

#Version: 1.0

gh auth logout
git config --global --unset user.name
git config --global --unset user.email 

echo "Successfully logged out of GitHub"
