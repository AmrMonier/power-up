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


function install_nodeJs {
  read -p  "Do you want to install Nodejs and NVM?(Y/n)" -n 1 -r ans
  ans=${ans:-Y} 
  if [[ $ans =~ ^[Yy]$ ]]; then
    echo -e "Downloading NVM..."
    wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    if [ $? != 0 ]; then

	    echo -e "\n${red}Failed${clear} to install NVM"
      exit 1
    fi
    echo -e "NVM installed ${green}Successfully${clear}"
    echo -e "Exporting NVM dir"
    echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc
echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.zshrc
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    echo "installing Node"
    nvm install node 
    if [ $? != 0 ]; then 
      echo -e "${red}Failed${clear} to Install NodeJs"
      exit 1
    fi
    echo -e "NodeJs Installed ${green}Successfully${clear}"
    echo "Installing npm Global packages (yarn nodemon typescript)"

    npm install --global yarn nodemon typescript
  fi
  echo
}

install_nodeJs