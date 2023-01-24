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

echo -e  "${magenta} Installing BeeKeeper Studio${clear}"
 
echo -e "Downloading BeeKeeper Studio Key"
 
wget --quiet -O - https://deb.beekeeperstudio.io/beekeeper.key | sudo apt-key add - && echo "deb https://deb.beekeeperstudio.io stable main" | sudo tee /etc/apt/sources.list.d/beekeeper-studio-app.list

if [ $? -eq 0 ] ; then
      echo -e "BeeKeeper Studio key is ${green}added successfully${clear}"
      echo -e "${cyan} Installing BeeKeeper Studio ${clear}"
      sudo apt update -qq &&  sudo apt install -y -qq beekeeper-studio
      if [ $? -eq 0 ]; then
              echo -e "BeeKeeper Studio Installed ${green}successfully${clear}"
      else
              echo -e "${red}Failed to Intall BeeKeeper Studio${clear}"
      fi
else
      echo -e "${red} failed to add BeeKeeper Studio key${clear}"
fi
