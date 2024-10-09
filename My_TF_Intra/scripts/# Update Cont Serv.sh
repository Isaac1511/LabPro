#!/bin/bash

# Update Cont Serv



# Update package list.
echo "Updating package list..."
sudo apt-get update -y


# Install epel release.
echo "Install epel release..."
sudo apt install -y epel-release 

#
echo "Install Ansible"
sudo apt install -y ansible

# Verify Ansible installed.
echo "Verify Ansible installed"
sudo ansible --version


# Upgrade istalled packages
echo "Upgrade packages with yum"
sudo yum install update

# End of Script
echo "Script Completed Succesfully"