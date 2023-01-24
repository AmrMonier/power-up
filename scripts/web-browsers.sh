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


echo "Installig Google Chrome"
wget --quiet https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
if [ $? != 0 ]; then 
  echo -e  "${red}Failed${clear} to download chrome"
else
  sudo dpkg -i google-chrome-stable_current_amd64.deb
  if [ $? -eq 0 ]; then
    echo -e "Chrome installed ${green}Successfully${clear}"
    sudo rm google-chrome-stable_current_amd64.deb
  else
    echo -e  "${red}Failed${clear} to install chrome"
  fi
fi

echo -e  "${magenta} Installing Brave Browser${clear}"

echo -e "Downloading brave keyring.gpg"

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg &&  echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

if [ $? -eq 0 ] ; then
	echo -e "brave key is ${green}added successfully${clear}"
	echo -e "${cyan} Installing Brave Browser ${clear}"
	sudo apt update -qq &&	sudo apt install -y -qq brave-browser
	if [ $? -eq 0 ]; then
		echo -e "Brave Browser Installed ${green}successfully${clear}"
	else
		echo -e "${red}Failed to Intall Brave Browser${clear}"
	fi
else
      echo -e "${red} failed to add brave key${clear}"
fi
