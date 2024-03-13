#!/bin/bash

#provides git with the user's login credentials

#Creation Date: 3/11/2024
#Last Updated: 3/11/2024
#Author: Simon Kowerski :)

#Version: 1.0

echo "Enter the credentials for your GitHub account below. If using an AuthToken I recommend setting it to never expire."
echo "Make sure to set the preferred authentication method to HTTPS"

read -p "Enter your GitHub email address (must have access to S.T.A.R. organization): " email
read -p "Enter your GitHub username: " username

gh auth login
git config --global user.email $email
git config --global user.name $username

echo "Successfully logged into GitHub. To undo this run osimager --logout"
