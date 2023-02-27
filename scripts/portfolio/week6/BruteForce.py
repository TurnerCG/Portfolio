####################################################################

# Author: Christopher Turner
# Creation Date: 01/2023
# Last Modified Data: 02/23
# Script Description: Python dictionary attack script. 

###################################################################
 
import hashlib
import itertools
import sys

# Changed script to Brute Force Attack

# hidden password hash
passwordHash = "6b3a55e0261b0304143f805a24924d0c1c44524821305f31d9277843b8a10f4e"

# define the character set to use for the brute force attack
charSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+-={}|[]\\:\";'<>?,./"

# define the minimum and maximum password lengths to generate
minLength = 6
maxLength = 8

# Colors for the output
GREEN = '\033[32m'
RED = '\033[31m'
YELLOW = '\033[33m'
RESET = '\033[0m'

print(f"Starting brute force attack with character set: {charSet}")
print(f"Trying passwords of length {minLength} to {maxLength}...")

# iterate over all possible password lengths
for length in range(minLength, maxLength + 1):
    # iterate over all possible password combinations of the current length
    for password in itertools.product(charSet, repeat=length):
        # join the password characters into a string
        passwordStr = ''.join(password)
        # hash the password
        passwordHashGuess = hashlib.sha256(passwordStr.encode("utf-8")).hexdigest()
        # print a status message
        print(f"Trying password {passwordStr}... ", end='', flush=True)
        # if the hash is the same as the correct password's hash then we have cracked the password!
        if(passwordHashGuess == passwordHash):
            print(GREEN + "PASSWORD CRACKED! It was " + passwordStr + RESET)
            sys.exit()
        else:
            print(RED + "nope." + RESET)
print(YELLOW + "Sorry, password not found." + RESET)
