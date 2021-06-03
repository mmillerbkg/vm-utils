#!/bin/sh

if [[ -f "/bin/zsh" ]]; then
    echo "ZSH already installed!"
    else
    apt install -y zsh
fi

echo "Installing profiles"

# Change directory to this directory
cd "${0%/*}"

# Copy aliases

cp ../.alias.d ~/

cp ../misc/.zshrc ~/.zshrc

# Install Powerlevel10k
echo 'Installing Powerlevel10k with modified defaults!'
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/powerlevel10k

cp ./.p10k.zsh ~/.p10k.zsh

echo "Good luck, have fun!"

