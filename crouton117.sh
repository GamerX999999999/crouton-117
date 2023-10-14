#!/bin/bash
RED='\033[0;31m'
GREEN='\033[4;32m'
NC='\033[0m' # No Color
############################################################
# Help                                                     #
############################################################
Help()
{
   # Display Help
   echo "A Crouton Installation Script for ChromeOS 117 and up!."
   echo
   echo "Syntax: crouton117 [-x|b|u|v|h]"
   echo "options:"
   echo "x     Installs Xenial chroot."
   echo "X     Resumes Xenial Script."
   echo "b     Installs Bionic* chroot."
   echo "B     Resumes Bionic* Script."
   echo "u     Update script."
   echo "v     Print script version and exit."
   echo "h     Prints this help message."
   echo
}
Xenial()
{
  #Downloads Xenial Chroot
  read -p "SELECTED:[XENIAL] Do you want to proceed? (y/n) " yn

case $yn in 
	[yY] ) echo "Proceeding...";
		break;;
	[nN] ) echo "exiting...";
		exit;;
	* ) echo "invalid response";;
esac

done

cd ~/
echo "Installing Xenial Chroot..."
echo "Make sure crouton is installed!"
sudo CROUTON_BRANCH=silence crouton -r xenial -t xfce
sudo enter-chroot
sudo apt install ssh
echo "1st step complete! Please run ./crouton117.sh -X to continue!"
}

Xenial2()
{
cd ~/
echo "Resuming Installation of Xenial"
sudo enter-chroot xenial
cd ~/Downloads
wget https://raw.githubusercontent.com/GamerX999999999/crouton-117/main/rc.local
cd ..
sudo cp ~/Downloads/rc.local /etc/
sudo chmod 755 /etc/rc.local
echo "rc.local has been inserted into /etc/"
echo "Xenial is now set up! Please type [Sudo enter-chroot] and launch crosh, type [shell] in crosh then [ssh foo@localhost] foo is a placeholder name, then [Sudo startxfce4] in crosh!"
}

Bionic()
{
cd ~/
echo "Installing Bionic* Chroot..."
echo "Make sure crouton is installed!"
sudo CROUTON_BRANCH=silence crouton -r bionic -t xfce
sudo enter-chroot
sudo apt install ssh
echo "1st step complete! Please run ./crouton117.sh -B to continue!"
}

Bionic2()
{
cd ~/
echo "Resuming Installation of Bionic*"
sudo enter-chroot bionic
cd ~/Downloads
wget https://raw.githubusercontent.com/GamerX999999999/crouton-117/main/rc.local
cd ..
sudo cp ~/Downloads/rc.local /etc/
sudo chmod 755 /etc/rc.local
echo "rc.local has been inserted into /etc/"
echo "Bionic* is now set up! Please type [Sudo enter-chroot] and launch crosh, type [shell] in crosh then [ssh foo@localhost] foo is a placeholder name, then [Sudo startxfce4] in crosh!"
}

Version()
{
	# Displays Version!
 echo -e "${GREEN}crouton117 v1.0.0_5${NC}"
 }
 

############################################################
############################################################
# Main program                                             #
############################################################
############################################################
############################################################
# Process the input options. Add options as needed.        #
############################################################
# Get the options
while getopts ":xXbBvh" option; do
   case $option in
      x) # INSTALL XENIAL
         Xenial
         exit;;
      X) # RESUME XENIAL INSTALLATION
         Xenial2
         exit;;
      b) # INSTALL BIONIC
         Bionic
         exit;;
      B) # RESUME BIONIC INSTALLATION
         Bionic2
         exit;;
      v) # display Version
         Version
         exit;;
      h) # display Help
         Help
         exit;;
     \?) # Invalid option
         echo -e "${RED}Error: Invalid option${NC}"
         exit;;
   esac
done


Help
