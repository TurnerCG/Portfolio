###################################################################

# Author: Christopher Turner
# Creation Date: 01/2023
# Last Modified Data: 02/23
# Script Description: Mega menu script containing links to all previous notable scripts and requires password. (password)

###################################################################

#!/bin/bash

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m'

# Define functions for colored output
function red {
    echo -e "${RED}$1${NC}"
}

function green {
    echo -e "${GREEN}$1${NC}"
}

function yellow {
    echo -e "${YELLOW}$1${NC}"
}

function blue {
    echo -e "${BLUE}$1${NC}"
}

# Run the password check script
sh /workspaces/portfolio/scripts/portfolio/week2/passwordCheck.sh

# Check if the password was entered correctly
if [ $? -eq 0 ]; then
    # Keep displaying the menu until user selects "exit"
    while true; do
        # Display the options menu
        yellow "============================="
        yellow "|    OPTIONS MENU           |"
        yellow "============================="
        blue "Please choose an option:"
        green "1. Create a folder"
        green "2. Copy a folder"
        green "3. Set a password"
        green "4. Calculator"
        green "5. Create Week Folders"
        green "6. Check Filenames"
        green "7. Download a File"
        red "8. Exit"
        yellow "============================="
        read choice

        case $choice in
          1)
            blue "Option 1: You chose to create a folder"
            sh /workspaces/portfolio/scripts/portfolio/week2/folderMaker.sh
            ;;
          2)
            blue "Option 2: You chose to copy a folder"
            sh /workspaces/portfolio/scripts/portfolio/week2/folderCopier.sh
            ;;
          3)
            blue "Option 3: You chose to set a password"
            sh /workspaces/portfolio/scripts/portfolio/week2/setPassword.sh
            ;;
          4)
            blue "Option 4: You chose to use the calculator"
            sh /workspaces/portfolio/scripts/portfolio/week3/calculator.sh
            ;;
          5)
            blue "Option 5: You chose to create week folders"
            sh /workspaces/portfolio/scripts/portfolio/week3/megafoldermaker.sh
            ;;
          6)
            blue "Option 6: You chose to check filenames"
            if [ -f /workspaces/portfolio/scripts/portfolio/week3/filenames.txt ]; then
                sh /workspaces/portfolio/scripts/portfolio/week3/filenames.sh
            else
                red "Error: filenames.txt not found" #If file cannot be found, returns a error message.
            fi
            ;;
          7)
            blue "Option 7: You chose to download a file"
            sh /workspaces/portfolio/scripts/portfolio/week3/downloader.sh
            ;;
          8)
            yellow "Goodbye!"
            exit
            ;;
          *)
            red "Invalid choice, please try again"
            ;;
        esac
    done
else
  # Password was incorrect, so exit the script
  red "Incorrect password"
  exit 1
fi
