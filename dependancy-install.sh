#!/bin/bash

echo ""
echo ""
echo "This script will install the necessary dependencies & format everything for COT-GENERATION from Survey123 Data"
echo ""
echo ""
read -p "Press any key to begin ..."
echo ""
echo ""
echo "Have you already created your survey? Do you have the file ID?"
echo "If not, do that now, then proceed with the script." 
echo ""
echo ""
read -p "Press any key to begin ..."

# Check python version 
python3 --version

# Install required packages
sudo apt install unzip curl -y
sudo apt install python3-pip 
pip install pandas

# Download and extract cot-gen
cd /tmp/CoT-Generation-Broadcast/cot-gen
ls -la
cp cot-gen.zip /opt
cd /opt/
unzip cot-gen.zip 
cd /opt/cot-gen/cot-gen
chmod +x /opt/cot-gen/*


# Prompt for file ID
read -p "Please enter your File ID: " fileid

# Confirm file ID  
read -p "Is this ($fileid) your file ID? (y/n) " confirm
if [[ $confirm == "n" ]]; then
  read -p "Please enter your File ID: " fileid
fi

# Edit File ID in csv-download.sh  
sed -i "s|curl -L \"https://docs.google.com/spreadsheets/d/<INSERT_FILE_ID_HERE>/export?format=csv\" -o \"/opt/cot-gen/csv/mission-data.csv\"|curl -L \"https://docs.google.com/spreadsheets/d/$fileid/export?format=csv\" -o \"/opt/cot-gen/csv/mission-data.csv\"|" csv-download.sh

# Select editor
echo "Do you use Nano (1) or Vim (2)"
read choice

# Open CSV download script
if [[ $choice == "1" ]]; then
  nano /opt/cot-gen/cot-gen/csv-download.sh
elif [[ $choice == "2" ]]; then  
  vi /opt/cot-gen/cot-gen/csv-download.sh
fi

# Run script and validate download
cd /opt/cot-gen/cot-gen/csv
chmod +x csv-download.sh
./csv-download.sh
ls -la 

read -p "Is the mission-data.csv file present in this directory? (y/n) " confirm
if [[ $confirm == "n" ]]; then
  ./csv-download.sh
fi

echo "Now checking python parse ability" 

cd /opt/cot-gen/cot-gen
python3 convert-csv.py

# Error validator 
echo "Were there any errors (y/n)"
read pythonerror

# Open CSV download script
if [[ $pythonerror == "y" ]]; then
  # Troubleshooting steps for Python error
  echo "Python error encountered. Performing troubleshooting steps..."
  # Insert your troubleshooting steps here
  # For example:
  # 1. Check if Python is installed
  # 2. Verify the required libraries are installed
  # 3. Check the Python script for syntax errors
  # End of troubleshooting steps
elif [[ $pythonerror == "n" ]]; then
  # Continue with the rest of the script when there is no Python error
  # Insert your CSV download code here
  # For example:
  # python your_script.py
  # Additional code for handling the downloaded CSV data
  echo "CSV download completed successfully."
fi

# INSERT NODE RED HERE

echo "Node Red" 
echo "Do you need to install node-red?" 
read node

# Open CSV download script
if [[ $node == "y" ]]; then
  apt install npm 
  click okay 
  sudo npm install -g --unsafe-perm node-red
  echo "Now Launching Node Red" 
  echo "proceed to https://localhost:1880"
  node-red
  # INSERT TROUBLESHOOTING HERE
elif [[ $node == "n" ]]; then  
  # Handle the case when node-red installation is not needed
  echo "Node-Red installation skipped."
fi

echo ""
echo ""
echo "This Script Is Now Complete"
echo ""
echo ""
