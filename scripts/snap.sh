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

function snapInstall {
read -p  "Do you want to install $1 from snap?(Y/n)" -n 1 -r ans
ans=${ans:-Y}
if [[ $ans =~ ^[Yy]$ ]]; then
	echo -e "\nInstalling ${cyan}$1 ${clear} using snap"
	sudo snap install $1 $2&& echo -e "${cyan}$1${clear} Installed ${green}Successfully${clear}" || echo -e "${red}Failed${clear} to Install ${cyan}$1${clear}"
fi
echo
}

# register any package you want to install here
snapInstall vlc
snapInstall code --classic
snapInstall slack
snapInstall mailspring
snapInstall postman
snapInstall spotify
snapInstall sublime-text --classic