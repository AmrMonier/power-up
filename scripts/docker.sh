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


function docker_desktop {
    
    echo -e "Removing old version of docker-desktop if exists"

    sudo apt remove docker-desktop && rm -r $HOME/.docker/desktop && sudo rm /usr/local/bin/com.docker.cli && sudo apt purge docker-desktop 

    echo -e "Installing docker-desktop dependencies"
    sudo apt install gnome-terminal -y -qq
    if [ $? != 0 ]; then 
        echo "${red}Failed${clear} to install docker-desktop dependencies"
        exit 1
    fi
    sudo mkdir -p /etc/apt/keyrings  && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo \
 "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  jammy stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    echo -e "Downloading docker-desktop"
    wget  https://desktop.docker.com/linux/main/amd64/docker-desktop-4.16.2-amd64.deb
    echo -e "docker-desktop downloaded ${green}Successfully${clear}"
    echo -e "Installing docker-desktop"
    sudo apt-get update -y -qq && sudo apt-get install ./docker-desktop-4.16.2-amd64.deb -y -qq
    if [$? != 0 ]; then
        echo "${red}Failed${clear} to install docker-desktop"
        exit 1
    fi
    echo -e "docker-desktop installed ${green}Successfully${clear}"
    sudo rm docker-desktop-4.16.2-amd64.deb
}


echo -e "Removing old installation of docker-engine"

sudo apt-get remove docker docker-engine docker.io containerd runc

echo -e  "Installing docker-engine dependencies"

sudo apt-get update -qq &&
 sudo apt-get -y -qq install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

if [ $? -eq 0 ]; then 
    echo -e "docker-engine dependencies installed ${green}Successfully${clear}"
    echo -e "Added docker-engine repository key"
    sudo mkdir -p /etc/apt/keyrings && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  jammy stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  echo -e "Installing docker-engine"

  sudo apt-get update -qq && sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y -qq

    if [ $? -eq 0 ]; then 
        echo -e "docker-engine installed ${green}Successfully${clear}"
        echo -e "Installing Docker-desktop"
        docker_desktop

    else
        echo -e "${red}Failed${clear} to install docker-engine"
    fi
else
    echo -e "${red}Failed${clear} to install docker-engine dependencies"
fi


