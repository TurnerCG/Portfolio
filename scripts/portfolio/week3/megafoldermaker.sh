#!/bin/bash

#If there isn't at least one argument to the script
if (( $# == 0 )); then
    #Print an error and exit
    echo "Error, provide at least one number" && exit 1
fi

#Loop through all the arguments provided
for arg in "$@"
do
    #If the argument is not a number
    if ! [[ "$arg" =~ ^[0-9]+$ ]]; then
        #Print an error and skip to the next argument
        echo "$arg is not a number, skipping..." && continue
    fi
    
    #Create a new folder for that number
    echo "Creating directory number $arg"
    mkdir "week$arg"
done
