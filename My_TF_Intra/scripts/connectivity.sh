# Setting up secure connectivity

#!/bin/bash 
clear

read -p "Enter hostname? " servname 

ssh-keygen -t rsa -b 4096
ssh-copy-id -i ~./ssh/id_rsa.pub (add var here for userinput)

echo "Verify connection"
ansible all -m ping

