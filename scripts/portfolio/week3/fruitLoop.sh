###################################################################

# Author: Christopher Turner
# Creation Date: 01/2023
# Last Modified Data: 02/23
# Script Description: Script that allows the user to select a fruit.

###################################################################

#!/bin/bash

for ((i=1; i<=5; i++))
do
    case $i in
        1) fruit="Apple" ;;
        2) fruit="Mango" ;;
        3) fruit="Strawberry" ;;
        4) fruit="Orange" ;;
        5) fruit="Banana" ;;
    esac
    echo "FRUIT: $fruit"
done
