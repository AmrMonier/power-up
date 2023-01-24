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

sudo apt install zsh -y -qq

if [ $? -eq 0 ]; then
    echo -e "Zsh installed ${green}Successfully${clear}"
    # make zsh the default shell
    chsh -s $(which zsh)

    echo -e "Installing Oh-my-zsh!"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo -e "${red}Failed${clear} to install Zsh"
fi