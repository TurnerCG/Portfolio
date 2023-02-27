###################################################################

# Author: Christopher Turner
# Creation Date: 01/2023
# Last Modified Data: 02/23
# Script Description: Script that makes new folders.

###################################################################

#!/bin/bash

read -p "type the name of the folder you would like to create: " folderName

mkdir "$folderName"

echo "Folder created successfully" | figlet

exit 0