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

filename="/workspaces/portfolio/scripts/portfolio/week3/filenames.txt"

# Check if the file exists before trying to read it
if [ -f $filename ]; then
  # Reads each line of the file
  while read line; do
    # Checks if the line is a file or directory
    if [ -z "$line" ]; then
      yellow "Blank line"
    elif [[ -f $line ]]; then
      green "That file exists"
    elif [[ -d $line ]]; then
      blue "That's a directory"
    else
      red "I don't know what that is!"
    fi
  done < $filename
else
  echo "The file $filename does not exist."
fi
