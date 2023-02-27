###################################################################

# Author: Christopher Turner
# Creation Date: 02/2023
# Last Modified Data: 02/23
# Script Description: Extracts latest breaches from HaveIBeenPwned

###################################################################

#!/bin/bash

# Define the URL to extract data from
URL="http://feeds.feedburner.com/HaveIBeenPwnedLatestBreaches"

# Define the directory to download the data to
DOWNLOAD_DIR="/workspaces/portfolio/scripts/assignment"

# Define color codes for text formatting
RED='\033[0;31m'
LIGHT_BLUE='\033[1;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Create the download directory if it doesn't exist
mkdir -p "$DOWNLOAD_DIR"

# Part 1: Download the feed
if ! curl -s "$URL" > "$DOWNLOAD_DIR/pwned_feed.xml"; then
  echo "Feed downloaded to $DOWNLOAD_DIR/pwned_feed.xml"
  echo -e "${RED}Error downloading the feed.${NC}" >&2
  exit 1
fi

# Part 2: Use xmlstarlet to extract the metadata and save it to a file
xmlstarlet sel -t -m "//item" -n -v "concat('Title: ', title)" -n -v "concat('Link: ', link)" -n -v "concat('Date: ', pubDate)" -n -v "concat('Description: ', description)" -n "$DOWNLOAD_DIR/pwned_feed.xml" > "$DOWNLOAD_DIR/breach_metadata.txt"

# Check if metadata was successfully saved to file
if [ ! -s "$DOWNLOAD_DIR/breach_metadata.txt" ]; then
  echo -e "${RED}Error: No metadata was saved to file.${NC}" >&2
  exit 1
fi

# Part 3: Output the contents of breach_metadata.txt to terminal with color-coded formatting
echo -e "${GREEN}Latest breaches:${NC}"
echo "============================================================"
while read line; do
  case $line in
    *Title:*) echo -e "${GREEN}$line${NC}";;
    *Link:*) echo -e "${LIGHT_BLUE}$line${NC}";;
    *Date:*) echo -e "${YELLOW}$line${NC}";;
    *Description:*) echo -e "${NC}$line${NC}"; echo "------------------------------------------------------------";;
  esac
done < "$DOWNLOAD_DIR/breach_metadata.txt"
