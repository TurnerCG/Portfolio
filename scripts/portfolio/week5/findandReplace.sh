###################################################################

# Author: Christopher Turner
# Creation Date: 01/2023
# Last Modified Data: 02/23
# Script Description: Edits and replaces details in other files.

###################################################################

#!/bin/bash

sed -i '/echo ".*!"/ s/Correct/Right/' /workspaces/portfolio/scripts/portfolio/week4/guessingGame.sh

grep 'echo .*".*!"' /workspaces/portfolio/scripts/portfolio/week4/guessingGame.sh
