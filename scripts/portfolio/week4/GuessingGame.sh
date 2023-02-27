###################################################################

# Author: Christopher Turner
# Creation Date: 01/2023
# Last Modified Data: 02/23
# Script Description: Advanced guessing game.

###################################################################

#!/bin/bash

# Define getNumber function to prompt for a number
function getNumber {
  read -p "Enter a number between 1 and 100: " guess
  while ! [[ $guess =~ ^[0-9]+$ ]] || (( guess < 1 || guess > 100 )); do
    read -p "Invalid guess. Enter a number between 1 and 100: " guess
  done
}

# Start game
echo "Guessing game!"
correct=42
while true; do
  getNumber
  if (( guess == correct )); then
    echo "Correct!"
    exit 0
  elif (( guess < correct )); then
    echo "Too Low!"
  else
    echo "Too High!"
  fi
done
