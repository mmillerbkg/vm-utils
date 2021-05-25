#!/bin/sh

apt update && apt upgrade -y

# Copy Aliases
cp -r ./.alias.d ~/