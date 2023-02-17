#!/bin/bash



# Ask the user to type a folder name
read -rp " Please input a name for the file storing the hashed password " folderName



mkdir "$folderName"



echo "FOLDER SUCCESSFULLY CREATED!"



# Create secret.txt file
touch secret.txt  



# ask the user to type a secret password (hide the input)
# -rsp
read -rsp "What password would you like to use to secure it (input is hidden): " password

echo "$password" > secret.txt



echo "SECRET PASSWORD PLACED IN secret.txt"
# hashing password and exporting results to secret.txt



echo "$password" | sha256sum >> secret.txt



echo "PASSWORD SECURED SAFELY IN secret.txt"

# save the user's password in a file called 'secret.txt' inside the folder the user chose.



mv secret.txt ~/student/scripts/portfolio/week2/"$folderName"



echo "Secret.txt MOVED TO $folderName"



echo "END" | figlet



exit 0