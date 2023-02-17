#!/bin/bash

# Reads each line of the file
while read line; do
  # Checks if the line is a file or directory
  if [[ -f $line ]]; then
    echo "That file exists"
  elif [[ -d $line ]]; then
    echo "That's a directory"
  else
    echo "I don't know what that is!"
  fi
done < filenames.txt
