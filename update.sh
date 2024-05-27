#!/bin/bash

# Script updates config data in git 

if [ -d ".config" ]; then
    rm -r .config
fi

mkdir .config

cp -r ~/.config/nvim/ .config/
cp -r ~/.config/tmux/ .config/
cp -r ~/.config/alacritty/ .config/

read -p "Do you want push it to github? (y/n) " yn

case $yn in 
    [yY] ) 
        git add .
        read -p "Enter commit name: " commit_name
        git commit -m "$commit_name"
        git push -u origin main;;
    * ) echo Did not pushed to github;;
esac

