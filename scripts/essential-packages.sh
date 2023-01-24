#!/bin/bash

# Color variables
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'
# Clear the color after that
clear='\033[0m'

echo "Installing Essential Packages"
echo "Running sudo apt update -qq"
sudo apt update -qq


PACKAGES=("git" "wget" "curl" "apt-transport-https"  "lsb-release" "ca-certificates"  "software-properties-common" "snapd")

loop through the array and install packages one by one
for pkg in "${PACKAGES[@]}"
do 
    install the package using apt-get without prompting for confirmation 
    sudo apt -y -qq install $pkg
   # check if the installation was successful or not and log accordingly 
   if [ $? -eq 0 ] ; then 
       echo "$pkg was successfully installed" >> /var/log/package_install.log 
	echo -e "$pkg was ${green}successfully${clear} installed"
   else 
       echo "Installation of $pkg failed" >> /var/log/package_install.log
	echo -e "Installation of $pkg ${red}failed" 
   fi 
done