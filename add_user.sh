#!/bin/bash

#Check if the script is being run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root"
    exit 1
fi

#Prompt for the username
read -p "Enter the username: " username

#Check if the user already exists
if id "$username" &>/dev/null; then
    echo "User '$username' already exists."
    exit 1
fi

#Prompt for a password
read -s -p "Enter password for $username:" password
echo

#Create the user with a home directory and a bash default shell
useradd -m -s /bin/bash "$username"

#Set the password
echo "$username:$password" | chpasswd

#Add user to the sudo group
read -p "Do you want to grant admin privileges to $username? (y/n): " is_admin

if [[ "$is_admin" =~ ^[Yy]$ ]]; then
    usermod -aG sudo "$username"
    echo "User $username added to sudo group"
fi

echo "------------------------"
echo "User $username has been created."
