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
sudo apt install python3-pandas

# Download and extract cot-gen
cd /tmp/CoT-Generation-Broadcast/cot-gen
ls -la
cp cot-gen.zip /opt
cd /opt/
unzip cot-gen.zip 
cd /opt/cot-gen/
chmod +x /opt/cot-gen/*




#Installs/Moves past apache2
echo "Do you already have Apache2/an equivelent installed? (y/n)"
read choice

#If Yes Than
if [[ $choice == "y" ]]; then
  nano /opt/cot-gen/csv-download.sh
  read -p "what is the absolute file path to the directory that Apache2 uses. (Do not enter the default path)(I.E. Apache2's Default is /var/www/html) " Absolute_path
  echo "Is $Absolute_path the right path to update? (y/n) "
  read pathyn
  if [[ $pathyn == "y" ]]; then
  
  #change the absolute file path if apache is already installed
  sed -i "s|curl -L \"with open('/var/www/html/COT-BROADCAST.xml', 'w') as xml_file:\"|curl -L \"with open('$Absolute_path/COT-BROADCAST.xml', 'w') as xml_file:\"|" opt/cot-gen/convert-csv.py


  #Verify Changes to output file path in convert-csv.py 
  echo "Do you use Nano (1) or Vim (2)"
  read nv
    if [[ $nv == "1" ]]; then
      nano /opt/cot-gen/convert-csv.py
    elif [[ $nv == "2" ]]; then  
      vi /opt/cot-gen/convert-csv.py
    fi

    #If the Absolute File Path is wrong than exit the script
  elif [[ $pathyn == "n" ]]; then  
      exit

#If Apache2/an eqivelent is not installed then install apache2 
elif [[ $choice == "n" ]]; then  
  echo "Starting Apache2 Install" 
  sudo apt install apache2
  ls /var/www/html 
  echo ""
  echo ""
  echo "Is there a file named index.html in the above directory? (y/n)"
  echo ""
  echo ""
  read choise
  if [[ $choice == "y" ]]; then
    echo "Apache2 Installed"
    echo "Moving On" 
  elif [[ $choice == "n" ]]; then  
    echo "Please externally (in a different command prompt install Apache2 or an equivelent)"
    echo "Press enter when ready to move on"
    read

fi

# Prompt for file ID
read -p "Please enter your File ID: " fileid

# Confirm file ID  
read -p "Is this ($fileid) your file ID? (y/n) " confirm
if [[ $confirm == "n" ]]; then
  read -p "Please enter your File ID: " fileid
fi

# Edit File ID in csv-download.sh  
sed -i "s|curl -L \"https://docs.google.com/spreadsheets/d/<INSERT_FILE_ID_HERE>/export?format=csv\" -o \"/opt/cot-gen/csv/mission-data.csv\"|curl -L \"https://docs.google.com/spreadsheets/d/$fileid/export?format=csv\" -o \"/opt/cot-gen/csv/mission-data.csv\"|" csv-download.sh


# Open CSV download script
if [[ $nv == "1" ]]; then
  nano /opt/cot-gen/csv-download.sh
elif [[ $nv == "2" ]]; then  
  vi /opt/cot-gen/csv-download.sh
fi

# Run script and validate download
cd /opt/cot-gen/
chmod +x csv-download.sh
./csv-download.sh
cd csv/
ls -la 

read -p "Is the mission-data.csv file present in this directory? (y/n) " confirm
if [[ $confirm == "n" ]]; then
  cd /opt/cot-gen/csv
  ./csv-download.sh
fi

echo "Now checking python parse ability" 

cd /opt/cot-gen/
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
echo "Do you need to install node-red? (y/n)" 
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
