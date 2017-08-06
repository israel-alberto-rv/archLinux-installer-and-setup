#!/bin/bash
source 00-config.sh

# ----------------------------------------------------------------------
# Arch Linux :: Setup
# ----------------------------------------------------------------------
# https://github.com/airvzxf/archLinux-installer-and-setup

# ----------------------------------------------------------------------
# Upgrade Nvidia when you upgrade pacman packages
# ----------------------------------------------------------------------
# When you upgrade you upgrade your package and this upgrade the Linux
# core libraries you need to upgrade your nvidia because it doesn't
# upgrade automatically.
# Normally when you reboot your computer and try to star nvidia-xrun
# this doesn't work then you need to follow this commands.
sudo pacman -S --noconfirm linux-headers

yaourt -S --noconfirm nvidia-utils-beta
yaourt -S --noconfirm nvidia-beta
