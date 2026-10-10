#!/bin/sh

if [ "$(id -u)" -ne 0 ]; then
    echo "This script installs files to root directories and may require root privileges. Run this with root or sudo."
    exit 2
fi

arch=$(arch)
page=$(getconf PAGESIZE)
id=$(grep "^ID=" /etc/os-release | cut -d'=' -f2 | tr -d '"')
version=$(grep "^VERSION_ID=" /etc/os-release | cut -d'=' -f2 | tr -d '"')

if [ "$page" != "4096" ]; then
    echo 'Error! You need a page size of "4096" to run FEX smoothly. Exiting...'
    exit 1
fi

if [ "${id}-${version}" != "debian-12" ]; then
    echo "Error! Detected system is '${id}-${version}'. This script is strictly for Debian 12 systems. Exiting..."
    exit 1
fi

if [ "$arch" = "x86_64" ]; then
    echo "Error! You are on x86_64, you need ARM64 for this to work. Exiting..."
    exit 1
elif [ "$arch" = "i386" ]; then
    echo "Error! You are on a 32-bit system, you need a 64-bit ARM64 version. Exiting..."
    exit 1
fi


echo "Downloading .tar.gz file from GitHub repo..."
if wget --quiet -O /tmp/FEX-Emu-Debian12-ARM64.tar.gz https://github.com/hfdhgretyu65676/Debian12-FEX-Pre-compiled/releases/download/Debian12/FEX-Emu-Debian12-ARM64.tar.gz; then
    echo "Download complete. Extracting..."
else
    echo "Command failed! Check if you have 'wget' installed and have a solid internet connection."
    exit 1
fi

if tar -xzvf /tmp/FEX-Emu-Debian12-ARM64.tar.gz -C /; then
    echo "Installed FEX successfully. Enjoy!"
    rm /tmp/FEX-Emu-Debian12-ARM64.tar.gz
    exit 0
else
    echo 'Command failed! Do you have "tar" installed yet?'
    exit 1
fi
