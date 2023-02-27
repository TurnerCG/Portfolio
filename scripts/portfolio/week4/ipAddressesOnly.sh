###################################################################

# Author: Christopher Turner
# Creation Date: 01/2023
# Last Modified Data: 02/23
# Script Description: Outputs the IP address information of the user.

###################################################################

#!/bin/bash

# Execute the ipInfo.sh script and capture the output
output=$(./ipInfo.sh)

# Use sed to display only the lines with "IP Address" on them
echo "$output" | sed -n '/IP Address/ p'
