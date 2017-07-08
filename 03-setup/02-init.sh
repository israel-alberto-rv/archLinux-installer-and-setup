#!/bin/bash
source 00-config.sh

# ----------------------------------------------------------------------
# Arch Linux :: Setup
# ----------------------------------------------------------------------
# https://github.com/airvzxf/archLinux-installer-and-setup

# ----------------------------------------------------------------------
# Init
# ----------------------------------------------------------------------
# This is the basic setup


# General setup for this script and the following
# ----------------------------------------------------------------------

# Create a temp directory for the next scripts
funcMkdir ~/workspace
funcMkdir ~/Downloads/temp

# I recommend you download this Git project in your computer if you
# want to get all files and information with the last updates.
# This project will be saved in ~/workspace/archLinux-installer-and-setup-master
# Uncomment this line if you want to download the project
# funcGetGitProject


# Pacman config
# ----------------------------------------------------------------------
# sudo nano /etc/pacman.conf

# Multilib
# Run and build 32-bit applications on 64-bit installations of Arch Linux.
# https://wiki.archlinux.org/index.php/Multilib

# Uncomment these both lines:
# [multilib]
# Include = /etc/pacman.d/mirrorlist
# This command delete the comments:
sudo sed -i '/\[multilib\]/,/mirrorlist/ s/^##*//' /etc/pacman.conf
sudo pacman -Syyu

# Uncomment #Color, if you want the pacman's output has colors
#Color
sudo sed -i '/Color$/ s/^##*//' /etc/pacman.conf



# Yaourt
# ----------------------------------------------------------------------

# Install yaourt: a pacman frontend which install the AUR packages.
funcInstallAur package-query
funcInstallAur yaourt

cd ~/Downloads/temp
git clone https://aur.archlinux.org/yaourt.git
cd ~/Downloads/temp/yaourt
makepkg -si