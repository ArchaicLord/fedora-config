#!/usr/bin/env bash

echo "Welcome to Archaic Lord's Fedora Gnome setup"


# Function PROMPT used to ask user for input
PROMPT () {
  read -p "Would you like to $1? (Y/y. Use any key to ignore): " -n 1 -r $2
}



CURRENT_DIR=$(pwd)
echo "The current working directory is: ${CURRENT_DIR}"

PROMPT "change the wokring directoy"

if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo -e "\n"
    read -p "Enter new working directory location:"$'\n' WORKING_DIR
    echo "WORKING_DIR set to: ${WORKING_DIR}"
else
    WORKING_DIR=$CURRENT_DIR
    echo -e "\n WORKING_DIR has not been changed from: ${WORKING_DIR}"
fi

PROMPT "import Archaic's wallpapers?"
if [[ $REPLY =~ ^[Yy]$ ]]
then
    if [ -d $WORKING_DIR/wallpapers ]
    then
	echo -e "\n Archaic's wallpapers are already on this system"
    else
	echo "Getting Archaic's wallpaper repo"
	git clone git@github.com:ArchaicLord/wallpapers.git

	echo "Running wallpaper setup scrip"
	$WORKING_DIR/wallpapers/setup.sh
    fi
fi



echo "Enabling fractional scaling"
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
echo "Fractional scaling enabled. Relog for change to take effect"

