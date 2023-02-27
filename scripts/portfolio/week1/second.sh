###################################################################

# Author: Christopher Turner
# Creation Date: 01/2023
# Last Modified Data: 02/23
# Script Description: Simple script which greets the user by name.

###################################################################

#!/bin/bash
# Script greets the user.
echo "Hi There!" | figlet
#After inputing name, the user is greeted by name and displayed in fancy text.
echo "It's good to see you $1" | figlet
exit 0