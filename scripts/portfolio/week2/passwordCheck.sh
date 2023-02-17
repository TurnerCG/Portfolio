#!/bin/bash 
# Ask the user to type a secret password (Hide that input).
# Check the user's password against the hash stored in 'secret.txt'.
# If the user's password is correct, print "Access Granted" and quit with the exit code 0.
# If the user's password is incorrect print "Access Denied" and quit with the exit code 1.

#password is "password"

echo "Enter the password" 

# Disable echoing of input and read the password into a variable
stty -echo
read password
stty echo
echo ""

echo -n $password | sha256sum -c  --status /workspaces/portfolio/scripts/portfolio/week2/TestOne/secret.txt

if [ "$?" = "0" ] 
    then
        echo "Access Granted"
    
        exit 0
    else
        echo "Access Denied" 
    
        exit 1
fi