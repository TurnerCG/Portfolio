#!/bin/bash

read -p "type the name of the folder you would like to create: " folderName

mkdir "$folderName"

echo "Folder created successfully" | figlet

exit 0