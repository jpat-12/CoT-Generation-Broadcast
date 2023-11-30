#!/bin/bash
echo ""
echo ""
echo "This script will install the necessary dependancies & format everything for COT-GENERATION from Survey123 Data"
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

# Download and extract cot-gen
cd /tmp/CoT-Generation-Broadcast/cot-gen
ls -la
cp cot-gen.zip /opt
cd /opt/
unzip cot-gen.zip 
cd /opt/cot-gen

# Prompt for file ID
read -p "Please enter your File ID: " fileid

# Confirm file ID  
read -p "Is this ($fileid) your file ID? (y/n) " confirm
if [[ $confirm == "y" ]]; then
  
  # Edit File ID in csv-download.sh  
  sed -i 'curl -L "https://docs.google.com/spreadsheets/d/<INSERT_FILE_ID_HERE/export?format=csv" -o "/opt/cot-gen/csv/mission-data.csv"' "curl -L "https://docs.google.com/spreadsheets/d/=$fileid/export?format=csv" -o "

if [[ $confirm == "n" ]]; then
  read -p "Please enter your File ID: " fileid


  # Select editor
  echo "Do you use Nano (1) or Vim (2)"
  read choice
  
  # Open CSV download script
  if [[ $choice == "1" ]]; then
    nano /opt/cot-gen/csv-download.sh
  elif [[ $choice == "2" ]]; then  
    vi /opt/cot-gen/csv-download.sh
  fi
  
  # Run script and validate download
  cd /opt/cot-gen
  ./csv-download.sh
  cd csv
  ls -la 
  
  read -p "Is the mission-data.csv file present in this directory? (y/n) " confirm
  if [[ $confirm == "n" ]]; then
    ./csv-download.sh
  fi

else
  echo "Invalid file ID"
  exit 1
fi

echo "Now checking python parse ability" 

cd /opt/cot-gen
python3 convert-csv.py

 # Error validator 
  echo "Were there any errors (y/n)"
  read pythonerror
  
  # Open CSV download script
  if [[ $pythonerror == "y" ]]; then
    #INSERT TROUBLESHOOTING HERE
  elif [[ $pythonerror == "n" ]]; then  
    
  fi



#INSERT NODE RED HERER

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
  
    #INSERT TROUBLESHOOTING HERE
  elif [[ $node == "n" ]]; then  
    
  fi


echo ""
echo ""
echo "This Script Is Now Complete"
echo ""
echo ""
