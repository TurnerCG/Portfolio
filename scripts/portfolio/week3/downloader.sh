#!/bin/bash

while true; do
    # Prompt user for website URL
    read -p "Enter website URL to download or 'exit' to quit: " url

    # Check if user wants to quit
    if [ "$url" = "exit" ]; then
        echo "Exiting..."
        break
    fi

    # Prompt user for download location
    read -p "Enter download location: " location

    # Use wget to download website
    wget -P "$location" -r -l 10 -k -p "$url"
done
