###################################################################

# Author: Christopher Turner
# Creation Date: 01/2023
# Last Modified Data: 02/23
# Script Description: Bash dictionary attack script. 

###################################################################

#!/bin/bash

# Hidden password hash
passwordHash="8b7df143d91c716ecfa5fc1730022f6b421b05cedee8fd52b1fc65a96030ad52"

# For each line in the file
for word in $(cat wordlist.txt); do
    # Hash the word
    wordlistHash=$(echo -n $word | sha256sum | awk '{ print $1; }')
    echo "Trying $word: $wordlistHash"
    
    # If the hash is the same as the correct password's hash then we have cracked the password!
    if [ $wordlistHash = $passwordHash ]; then
        echo "Password has been cracked! It was $word"
        exit 0
    fi
done

exit 1
