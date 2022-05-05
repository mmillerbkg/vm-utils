#!/bin/bash

if [[ -e "/bin/zsh" ]]; then
    echo "ZSH already installed!"
    else
    apt install -y zsh
fi

echo "Installing profiles"

# Change directory to this directory
cd "${0%/*}"

# Copy aliases

git clone https://gitlab.com/millerthyme/alias.d $HOME/.alias.d

cp ../misc/.zshrc ~/.zshrc

# Install Powerlevel10k
echo 'Installing Powerlevel10k with modified defaults!'

if [[ -d "$HOME/powerlevel10k" ]]; then

    echo "Powerlevel10k already installed. Pulling most recent changes"
    cd $HOME/powerlevel10k

    git pull

    else

    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/powerlevel10k

fi

cp ../misc/.p10k.zsh ~/.p10k.zsh

echo "Good luck, have fun!"

