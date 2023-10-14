#!/bin/bash
RED='\033[0;31m'
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
   echo "b     Installs Bionic* chroot."
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

echo "Installing Xenial Chroot..."
echo "Make sure crouton is installed!"
sudo CROUTON_BRANCH=silence crouton -r xenial -t xfce

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
while getopts ":xbuvh" option; do
   case $option in
      x) # display Help
         Xenial
         exit;;
      b) # display Help
         Bionic
         exit;;
      u) # display Help
         Update
         exit;;
      v) # display Help
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
