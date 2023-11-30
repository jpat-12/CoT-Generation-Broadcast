#!/bin/bash

# Remove existing file, if it exists
if [ -f "/opt/cot-gen/csv/mission-data.csv" ]; then
    rm "/opt/cot-gen/csv/mission-data.csv"
fi

# Download the file using curl
curl -L "https://docs.google.com/spreadsheets/d/<INSERT_FILE_ID_HERE/export?format=csv" -o "/opt/cot-gen/csv/mission-data.csv"
# Print message after file download
echo "Mission Data CSV File Downloaded"

