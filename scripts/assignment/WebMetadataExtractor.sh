#!/bin/bash

# Download the website using cURL and store it in a temporary file
temp_file=$(mktemp)
curl -s "https://haveibeenpwned.com/PwnedWebsites" > "$temp_file"

# Extract the data using grep and sed, and format it as a table using awk
table=$(grep -oP '(?<=<tbody>).*?(?=</tbody>)' "$temp_file" | sed 's/<\/tr>/\n/g' | sed 's/<[^>]*>//g' | awk 'BEGIN{printf("%-50s\t%-50s\t%s\n", "Website", "Date of Breach", "Number of Accounts")} {printf("%-50s\t%-50s\t%s\n", $1, $2, $3)}')

# Print the table
echo "$table"

# Delete the temporary file
rm "$temp_file"
