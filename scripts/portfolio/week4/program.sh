###################################################################

# Author: Christopher Turner
# Creation Date: 01/2023
# Last Modified Data: 02/23
# Script Description: Function defining support script

###################################################################

#!/bin/bash

# Script meant to be called by other scripts to define functions 
# Work in progress

# Define a function to print errors in red color
printError() {
    echo -e "\033[31mERROR: $1\033[0m"
}

# Define a function to print usage instructions in yellow color
printUsage() {
    echo -e "\033[33mUsage: $0 [options]\033[0m"
    echo "Options:"
    echo " -h, --help     Print this help message"
}

# Define a function to print a message with green color
printMessage() {
    echo -e "\033[32m$1\033[0m"
}

# Example usage of the printError, printUsage, and printMessage functions
if [ $# -ne 1 ]; then
    printError "Invalid number of arguments. Expected 1, got $#."
    printUsage
    exit 1
fi

if [ ! -f "$1" ]; then
    printError "File not found: $1"
    exit 1
fi

printMessage "Success! File found: $1"
