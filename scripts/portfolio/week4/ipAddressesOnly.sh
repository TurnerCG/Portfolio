#!/bin/bash

# Execute the ipInfo.sh script and capture the output
output=$(./ipInfo.sh)

# Use sed to display only the lines with "IP Address" on them
echo "$output" | sed -n '/IP Address/ p'
