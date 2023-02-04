#!/bin/bash
# Below will request the names of those running the script. Changed to ask for 3 names.
read -rp "hello, please enter your three names: " nameOne nameTwo nameThree
#Will show the Unit after the names.
unit="CYB6004 Scripting Languages"

echo -e "Hello $nameOne, $nameTwo, and $nameThree! Welcome to: \n $unit"
# Note order of operation for "rsp", this will hide input of password.
read -rsp "What is the secret password: " password

echo "I won't tell anyone!"
# This will show the password that was previously entered.
echo "I lied! Your password is $password MUWAHAHAHA!!"

exit 0