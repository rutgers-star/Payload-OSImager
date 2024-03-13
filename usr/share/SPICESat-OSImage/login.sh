#!/bin/bash

#provides git with the user's login credentials

#Creation Date: 3/11/2024
#Last Updated: 3/11/2024
#Author: Simon Kowerski :)

#Version: 1.0

echo "Enter the credentials for your GitHub account below. If using an AuthToken I recommend setting it to never expire."
echo "Make sure to set the preferred authentication method to HTTPS"

gh auth login

