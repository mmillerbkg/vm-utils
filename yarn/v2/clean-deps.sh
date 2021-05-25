#!/bin/zsh

if [ -f "$PWD/.yarnrc.yml" ]; then
    echo "Deleting cache!"
    rm -drf "$PWD/.yarn/cache/*"
    rm -drf "$PWD/.yarn/unplugged"
    rm -rf "$PWD/.yarn/*.gz"
    rm -rf "$PWD/.yarn/*.yml"
    rm -rf yarn.lock
    echo "Cleaned up! Run yarn install when ready!"
    
    else
    echo "Could not find a .yarnrc.yml file, check directory and try again.";    
fi