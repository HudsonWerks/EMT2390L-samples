#!/bin/bash

#Bash script to rename a Raspberry pi Hostname
#Use at own risk

#Read current hostname
oldHostname=$(hostname)
echo "Current hostname: "$oldHostname

#Enter new hostname
echo "Please enter new host name:"
read hostName
if [ -z "${hostName}" ]; then
    echo "Host name cannot be blank"
    echo "Please enter new host name:"
    read hostName
fi

#Permanantly change hostname from current hostname
string='s/'$oldHostname'/'$hostName'/g'
sudo sed -i $string /etc/hostname
sudo sed -i $string /etc/hosts
sudo /etc/init.d/hostname.sh
hostname
echo "Please reboot"
# sudo reboot #Uncomment this if you want to automatically reboot when done
