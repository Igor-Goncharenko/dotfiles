#!/bin/bash

read -p "Installation may replace your config files. Do you want to continue? (yes) " yn

if [ "$yn" != "yes" ] && [ "$yn" != "Yes" ]; then
    # Exit program if not 'yes'
    echo "Installation canceled"
    exit
fi

# else continue installation
mkdir temp
git clone https://github.com/Igor-Goncharenko/dotfiles temp/

if [ -d "~/.config/tmux/" ]; then
    rm -r ~/.config/tmux
fi
cp -r temp/.config/tmux ~/.config/


#sudo rm -r temp/

