#!/bin/bash

# ----------------------------------------------------------------------
# Arch Linux :: Setup
# ----------------------------------------------------------------------
# https://github.com/airvzxf/archLinux-installer-and-setup

# ----------------------------------------------------------------------
# Functions
# ----------------------------------------------------------------------
# Set the functions to use in all the scripts

funcIsEmptyString() {
	if [ -z $1 ]; then
		return 0
	fi

	return 1
}

funcIsConnectedToInternet() {
	if ! ping -c 1 google.com >> /dev/null 2>&1; then
			echo -e ""
			echo -e "You have problems with your Internet."
			echo -e "Please check if: "
			echo -e "- The Internet works properly"
			echo -e "- The Internet cable is connected to your computer and modem"
			echo -e "- If you have wifi please execute this command: 'wifi-menu' and connect in your account"
			echo -e ""
			exit -1
	fi
}

funcIsPackageInstalled() {
	if ! funcIsEmptyString $1; then
		if $(which $1 &>/dev/null); then
			return 0
		fi
	fi

	return 1
}

funcInstallPackage() {
	if ! funcIsEmptyString $1; then
		if ! funcIsPackageInstalled $1; then
			echo -e "$1 package not found!\n"
			sudo pacman -S $1
		fi
	fi

	return 0
}

funcMkdir() {
	if ! funcIsEmptyString $1; then
		eval mkdir -p $1
	fi

	return 1
}

funcInstallAur() {
	directory=~/Downloads/temp/
	funcMkdir $directory

	if ! funcIsEmptyString $1; then
		cd $directory
		git clone https://aur.archlinux.org/$1.git

		cd $1
		makepkg -si --needed --noconfirm

		cd ..
		rm -fR $1
	fi
	
	rm -fR $directory

	return 0
}

funcGetGitProject() {
	funcInstallPackage unzip
	funcMkdir ~/workspace

	cd ~/workspace
	curl -LOk -H 'Cache-Control: no-cache' https://github.com/airvzxf/archLinux-installer-and-setup/archive/master.zip
	unzip -o master.zip
	rm -f master.zip
	find ./archLinux-installer-and-setup-master -type f -iname *.sh -exec chmod +x {} \;

	return 0
}
