###################################################################

# Author: Christopher Turner
# Creation Date: 01/2023
# Last Modified Data: 02/23
# Script Description: Checks .txt file contents and outputs basic information on details.

###################################################################

#!/bin/bash

filename="/workspaces/portfolio/scripts/portfolio/week3/filenames.txt"

# Check if the file exists before trying to read it
if [ -f "$filename" ]; then
  # Reads each line of the file
  while read line; do
    # Checks if the line is a file or directory
    if [ -z "$line" ]; then
      echo "\033[1;33mBlank line\033[0m"
    elif [ -f "$line" ]; then
      echo "\033[0;32mThat file exists\033[0m"
    elif [ -d "$line" ]; then
      echo "\033[1;34mThat's a directory\033[0m"
    else
      echo "\033[0;31mI don't know what that is!\033[0m"
    fi
  done < "$filename"
else
  echo "The file $filename does not exist."
fi