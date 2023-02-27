###################################################################

# Author: Christopher Turner
# Creation Date: 02/2023
# Last Modified Data: 02/23
# Script Description: Extracts latest breaches from HaveIBeenPwned

###################################################################

#!/bin/bash

# Define color codes
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
PURPLE='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m'

# Define the URL to extract data from
URL="http://feeds.feedburner.com/HaveIBeenPwnedLatestBreaches"

# Define the directory to download the data to
DOWNLOAD_DIR="/workspaces/portfolio/scripts/assignment"

# Create the download directory if it doesn't exist
mkdir -p "$DOWNLOAD_DIR"

# Create the metadata file if it doesn't exist
touch "$DOWNLOAD_DIR/breach_metadata.txt"

# Check that the metadata file was created
if [ ! -f "$DOWNLOAD_DIR/breach_metadata.txt" ]; then
  echo "${RED}Error creating the metadata file.${NC}" >&2
  exit 1
fi

# Download the feed
if ! curl -s "$URL" > "$DOWNLOAD_DIR/pwned_feed.xml"; then
  echo "Feed downloaded to $DOWNLOAD_DIR/pwned_feed.xml"
  echo "${RED}Error downloading the feed.${NC}" >&2
  exit 1
fi

# Use xmllint to extract the metadata and save it to a file
xmllint --xpath '//item' "$DOWNLOAD_DIR/pwned_feed.xml" | while read -r line; do
  title=$(echo "$line" | xmllint --xpath 'string(./title/text())')
  link=$(echo "$line" | xmllint --xpath 'string(./link/text())')
  pubDate=$(echo "$line" | xmllint --xpath 'string(./pubDate/text())')
  description=$(echo "$line" | xmllint --xpath 'string(./description/text())')
  printf "Title: %s\nLink: %s\nDate: %s\nDescription: %s\n\n" "$title" "$link" "$pubDate" "$description" >> "$DOWNLOAD_DIR/breach_metadata.txt"
done

# Check if metadata was successfully saved to file
if [ ! -s "$DOWNLOAD_DIR/breach_metadata.txt" ]; then
  echo "${RED}Error: No metadata was saved to file.${NC}" >&2
  exit 1
fi

# Format the metadata into a table
echo -e "${GREEN}Latest breaches:${NC}"
awk '{ printf("| %-80s | %-30s | %-100s |\n", $1, $2, $4); }' "$DOWNLOAD_DIR/breach_metadata.txt" > "$DOWNLOAD_DIR/breach_table.txt"

# Check if the table file was created
if [ ! -f "$DOWNLOAD_DIR/breach_table.txt" ]; then
  echo "${RED}Error creating the table file.${NC}" >&2
  exit 1
fi

# Check if the metadata file exists, and if so, delete it
if [ -f "$DOWNLOAD_DIR/breach_metadata.txt" ]; then
  rm "$DOWNLOAD_DIR/breach_metadata.txt"
fi

echo -e "${GREEN}Success!${NC}"

# Print the table
echo -e "${GREEN}Latest Breaches:${NC}"
cat "$DOWNLOAD_DIR/breach_table.txt" | column -t -s $'\t'

# Clean up temporary files
rm "$DOWNLOAD_DIR/breach_data.xml" "$DOWNLOAD_DIR/breach_table.txt"

