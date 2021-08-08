#!/bin/sh

# Tanush's archlinux bootstraping script

####### VARIABLES ######
aurhelper=paru

###### FUNCTIONS #######
# Updating the system
systemup() { \
	dialog --title "Updating system!" --infobox "Please wait while the script updates the system..." 10 30
	sudo pacman --needed --noconfirm -Syu > /dev/null
	dialog --title "Installing git" --infobox "Downloading and Installing git ..." 10 30
	sudo pacman --needed --noconfirm -S git > /dev/null
}

# Before main installation
binstallation() { \
	pacman --noconfirm --needed -S dialog 
}	

# Last chance to exit
lmbi() { \
	dialog --title "TABS Installation" --yes-label "Let's start!" --no-label "Nevermind!, exit the script" --yesno "After this point of the script, The installation will be fully automatic, This point is your last chance, of exiting if you want to.\\n\\n BEWARE: This script will override your existing dotfiles, so make sure you go forward, if you know what you are doing: " 10 65
}

# Get user and password
guserpass() { \
	name=$(dialog --title "User and password" --inputbox "Make sure you spell your user correctly and do not give an invalid name, as this script is still in development and has no checks for now: " 10 60 3>&1 1>&2 2>&3 3>&1) || exit 1
}


# Welcome message
wmsg() { \
    dialog --title "About TABS" --msgbox "This script will install a full-featured linux desktop environment, which I use everyday. This will include things such as my default browser, terminal etc.\\n\\n-Tanush" 10 60

    dialog --title "NOTE:" --yes-label "Ready!" --no-label "No stop!" --yesno "Make sure that the computer you are using has all the current pacman updates and has updated keyrings!"  10 60
}

# Install package
ipkg() { pacman --noconfirm --needed -S "$1" >/dev/null 2>&1 ; }

# Showing error message
err() { echo "ERROR: $1"; exit 1; }

# Installing paru
pins() { \
	dialog --title "TABS Installation" --infobox "Installing paru an AUR helper." 5 70
	}


##### INSTALLATION #####

# Install dialog
binstallation || err "Exited!"

# Welcome message
wmsg || err "Exited!"

# Get and verify username and password
guserpass || err "Exited!"

# Last chance!
lmbi || err "Exited!"

# Updating system!
systemup || err "Exited!"

