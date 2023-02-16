#!/bin/bash

# Run the first script
sh /workspaces/portfolio/portfolio/week2/passwordCheck.sh

# Check if the password was entered correctly
if [ $? -eq 0 ]; then

# Display the options menu
echo "Please choose an option:"
echo "1. Create a folder"
echo "2. Copy a folder"
echo "3. Set a password"

read choice

case $choice in
  1)
    echo "Option 1: You chose to create a folder"
    sh /workspaces/portfolio/portfolio/week2/folderCreator.sh
    ;;
  2)
    echo "Option 2: You chose to copy a folder"
    sh /workspaces/portfolio/portfolio/foldercopier.sh
    ;;
  3)
    echo "Option 3: You chose to set a password"
    sh /workspaces/portfolio/portfolio/week2/setPassword.sh
    ;;
  *)
    echo "Invalid choice"
    ;;
esac
else
  # Password was incorrect, so exit the script
  echo "Incorrect password"
  exit 1
fi