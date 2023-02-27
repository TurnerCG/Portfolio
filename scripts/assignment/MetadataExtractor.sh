###################################################################

# Author: Christopher Turner
# Creation Date: 02/2023
# Last Modified Data: 02/23
# Script Description: Extracts metadata from haveibeenpwned.com/PwnedWebsites and ranks the "Pwned" websites.

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
URL="https://haveibeenpwned.com/PwnedWebsites"

# Define the regular expressions to extract data from the HTML
ID_REGEX='id="[A-Za-z0-9_\-]+'
BREACH_DATE_REGEX='<strong>Breach date:</strong> ([0-9]+ [A-Za-z]+ [0-9]{4})<br />'
DATE_ADDED_REGEX='<strong>Date added to HIBP:</strong> (.*?)<br />'
COMPROMISED_ACCOUNTS_REGEX='<strong>Compromised accounts:</strong> ([0-9,]+)<br />'
COMPROMISED_DATA_REGEX='<strong>Compromised data:</strong> (.*?)<br />'

# Define the directory to download the data to
DOWNLOAD_DIR="/workspaces/portfolio/scripts/assignment"

# Create the download directory if it doesn't exist
mkdir -p "$DOWNLOAD_DIR"

# Create the metadata file if it doesn't exist
touch "$DOWNLOAD_DIR/metadata.txt"

# Check that the metadata file was created
if [ ! -f "$DOWNLOAD_DIR/metadata.txt" ]; then
  echo "${RED}Error creating the metadata file.${NC}" >&2
  exit 1
fi

# Download the HTML page
if ! curl -s "$URL" > "$DOWNLOAD_DIR/PwnedWebsites.html"; then
  echo "HTML page downloaded to $DOWNLOAD_DIR/PwnedWebsites.html"
  echo "${RED}Error downloading the HTML file.${NC}" >&2
  exit 1
fi

# Extract the IDs from the downloaded file
if ! grep -oP "$ID_REGEX" "$DOWNLOAD_DIR/PwnedWebsites.html" > "$DOWNLOAD_DIR/ids.txt"; then
  echo "${RED}Error extracting the IDs.${NC}" >&2
  exit 1
fi

# Extract the metadata for each ID and save it to a file
while read -r id; do
  metadata=$(grep -oP "(?s)$id.*?</ul>" "$DOWNLOAD_DIR/PwnedWebsites.html" | sed 's/<[^>]*>//g')
  if [ -n "$metadata" ]; then
    breach_date=$(echo "$metadata" | grep -oP "$BREACH_DATE_REGEX" | sed 's/<[^>]*>//g' | sed 's/^\s*//;s/\s*$//')
    date_added=$(echo "$metadata" | grep -oP "$DATE_ADDED_REGEX" | sed 's/<[^>]*>//g' | sed 's/^\s*//;s/\s*$//')
    compromised_data=$(echo "$metadata" | grep -oP "$COMPROMISED_DATA_REGEX" | sed 's/<[^>]*>//g' | sed 's/^\s*//;s/\s*$//')

      printf "%s\nBreach date: %s\nDate added to HIBP: %s\nCompromised accounts: %s\nCompromised data: %s\n\n" "$id" "$breach_date" "$date_added" "$compromised_data" "$compromised_data" >> "$DOWNLOAD_DIR/metadata.txt"
  fi
done < "$DOWNLOAD_DIR/ids.txt"

# Check if metadata was successfully saved to file
if [ ! -s "$DOWNLOAD_DIR/metadata.txt" ]; then
  echo "${RED}Error: No metadata was saved to file.${NC}" >&2
  exit 1
fi

# Rank the Pwned websites by number of compromised accounts
echo -e "${GREEN}Ranking the Pwned websites by number of compromised accounts:${NC}"
sort -t $'\t' -k 2nr "$DOWNLOAD_DIR/metadata.txt" | awk 'BEGIN { FS="\n" ; RS="" } { print $1 "\n" $2 "\n\n" }' > "$DOWNLOAD_DIR/rankings.txt"

# Check if the rankings file was created
if [ ! -f "$DOWNLOAD_DIR/rankings.txt" ]; then
  echo "${RED}Error creating the rankings file.${NC}" >&2
  exit 1
fi

echo -e "${GREEN}Rankings saved to ${DOWNLOAD_DIR}/rankings.txt.${NC}"
