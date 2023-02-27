###################################################################

# Author: Christopher Turner
# Creation Date: 01/2023
# Last Modified Data: 02/23
# Script Description: Script that creates multiple week folders.

###################################################################

#!/bin/bash

# Prompt the user to enter the week number
echo "Enter the week number to be created:"
read week_number

# Check if the week number is a valid integer
if ! [[ "$week_number" =~ ^[0-9]+$ ]]; then
    echo "$week_number is not a valid week number, exiting..." && exit 1
fi

# Create the directory for the specified week number
echo "Creating directory for week $week_number"
mkdir "week$week_number"
