###################################################################

# Author: Christopher Turner
# Creation Date: 01/2023
# Last Modified Data: 02/23
# Script Description: Script that copies folders.

###################################################################

#!/bin/bash

read -p "type the name of the folder you would like to copy: " folderName

#if the name is a valid directory

if [ -d "$folderName" ]; then

    #copy it to a new location

    read -p "type the name of the destination folder: " newFolderName

    cp -r "$folderName" "$newFolderName"

else

   #otherwise, print an error

    echo "I couldn't find that folder"

fi
					