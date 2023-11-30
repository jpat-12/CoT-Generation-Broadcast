#!/bin/bash

# Remove existing file, if it exists
if [ -f "/opt/cot-gen/csv/mission-data.csv" ]; then
    rm "/opt/cot-gen/csv/mission-data.csv"
fi

# Download the file using curl
curl -L "https://docs.google.com/spreadsheets/d/1BqQ8ZlUyDCp6T4a0tZTIrdeCjd84oS99EwORsvYGd80/export?format=csv" -o "/opt/cot-gen/csv/mission-data.csv"
# Print message after file download
echo "Mission Data CSV File Downloaded"

