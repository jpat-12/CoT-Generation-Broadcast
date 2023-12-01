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
clear

echo "Will you be using apt or yum (apt/yum)"
read ay 
clear
# Check python version 
python3 --version

# Install required packages
echo "Installing Dependencies & needed Packages"
sudo $ay update
sudo $ay install unzip curl -y
sudo $ay install python3-pip 
sudo $ay install python3-pandas
clear

# Download and extract cot-gen
echo "Setting Up Cot-Gen Directory in Opt"
sleep 4
cd /tmp/CoT-Generation-Broadcast/cot-gen
ls -la
cp cot-gen.zip /opt
cd /opt/
unzip cot-gen.zip 
cd /opt/cot-gen/
chmod +x /opt/cot-gen/*
clear


#Installs/Moves past apache2
echo "Do you already have Apache2/an equivelent installed? (y/n)"
read choice

#If Yes Than
if [[ $choice == "y" ]]; then
   
  echo "Are you useing the default absolute file directory (/var/www/html) (y/n)"
  read pls
  if [[ $pls == "y" ]]; then
      echo "Moving on"
  elif [[ $pls == "n" ]]; then  
        read -p "what is the absolute file path to the directory that Apache2 uses. (Do not enter the default path)(I.E. Apache2's Default is /var/www/html) " Absolute_path
        echo "Is $Absolute_path the right path to update? (y/n) "
        read pathyn
        if [[ $pathyn == "y" ]]; then
            #change the absolute file path if apache is already installed
            sed -i "s|curl -L \"with open('/var/www/html/COT-BROADCAST.xml', 'w') as xml_file:\"|curl -L \"with open('$Absolute_path/COT-BROADCAST.xml', 'w') as xml_file:\"|" /opt/cot-gen/convert-csv.py
            #Verify Changes to output file path in convert-csv.py 
            echo "Do you use Nano (1) or Vim (2)"
            read nv
            if [[ $nv == "1" ]]; then
                nano /opt/cot-gen/convert-csv.py
            elif [[ $nv == "2" ]]; then  
            vi /opt/cot-gen/convert-csv.py
            fi
            # If the Absolute File Path is wrong than exit the script
            elif [[ $pathyn == "n" ]]; then  
            exit
        fi
  fi



  #If Apache2/an eqivelent is not installed then install apache2 
elif [[ $choice == "n" ]]; then  
  echo "Starting Apache2 Install" 
  sudo $ay install apache2
  clear
  echo ""
  echo ""
  echo "Showing Contense of /var/www/html"
  ls -la /var/www/html 
  echo ""
  echo ""
  echo "Is there a file named index.html in the above directory? (y/n)"
  echo ""
  echo ""
  read choice  # Corrected variable name here
  if [[ $choice == "y" ]]; then
    echo "Apache2 Installed"
    echo "Moving On" 
    clear
  elif [[ $choice == "n" ]]; then  
    echo "Please externally (in a different command prompt install Apache2 or an equivelent)"
    echo "Press enter when ready to move on"
    read misc
    clear
  fi
fi
clear

# Prompt for file ID
read -p "Please enter your Google Sheets File ID: " fileid

# Confirm file ID  
read -p "Is this ($fileid) your file ID? (y/n) " confirm
if [[ $confirm == "n" ]]; then
  read -p "Please enter your File ID: " fileid
fi
clear
# Edit File ID in csv-download.sh  
sed -i "s|curl -L \"https://docs.google.com/spreadsheets/d/<INSERT_FILE_ID_HERE>/export?format=csv\" -o \"/opt/cot-gen/csv/mission-data.csv\"|curl -L \"https://docs.google.com/spreadsheets/d/$fileid/export?format=csv\" -o \"/opt/cot-gen/csv/mission-data.csv\"|" csv-download.sh


# Open CSV download script
if [[ $nv == "1" ]]; then
  nano /opt/cot-gen/csv-download.sh
elif [[ $nv == "2" ]]; then  
  vi /opt/cot-gen/csv-download.sh
fi
clear

# Run script and validate download
echo "Running & Validating download of Cot-Gen"
cd /opt/cot-gen/
chmod +x csv-download.sh
echo "Running csv-download.sh (this downloads your spreadsheet in the CSV format)"
./csv-download.sh
echo ""
echo ""
cd csv/
ls -la 
echo ""
echo ""

read -p "Is the mission-data.csv file present in this directory? (y/n) " confirm
if [[ $confirm == "n" ]]; then
  cd /opt/cot-gen/csv
  ./csv-download.sh
fi
clear

echo "Now checking python parse ability" 

cd /opt/cot-gen/
python3 convert-csv.py

echo "Cot-Gen Installed & working" 


# NodeJS & Node-Red Install & Setup
echo "Moving On To (optional Node Red Install)" 
echo ""
echo "Do you need to install node-red? (y/n)" 
read node

# Open CSV download script
if [[ $node == "y" ]]; then
  sudo $ay update
  sudo $ay install npm 
  npm install -g npm@10.2.4
  sudo $ay install nvm
  # Download the Node.js tarball
  curl -O https://nodejs.org/dist/v20.10.0/node-v20.10.0-linux-s390x.tar.xz

 # Extract the tarball
  tar -xf node-v20.10.0-linux-s390x.tar.xz

  # Move the Node.js files to /usr/local/
  sudo mv node-v20.10.0-linux-s390x/* /usr/local/

  # Update PATH
  export PATH=$PATH:/usr/local/bin
  source ~/.bashrc   # or source ~/.zshrc, depending on your shell

  # Verify installation
  node -v
  npm -v

  #click okay 
  #sudo npm install -g --unsafe-perm node-red
  #click okay 
  #curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
  #curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
  #export NVM_DIR="$HOME/.nvm"
  #[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  #[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  sudo nvm install 14
  sudo nvm use 14
  #upgrade nodejs
  sudo nvm install node --reinstall-packages-from=node
  #reinstall node-red
  sudo npm install -g --unsafe-perm node-red
  sleep 20
  echo "proceed to https://localhost:1880"
  ufw allow 1880
    # INSERT TROUBLESHOOTING HERE
elif [[ $node == "n" ]]; then  
  # Handle the case when node-red installation is not needed
  echo "Node-Red installation skipped."
fi

cd /opt/cot-gen
ls -la
echo ""
echo ""
echo "This Script Is Now Complete"
echo "You now have Apache2, Cot-Gen, & Node-red Installed" 
echo "To update your Survey123 to Cot run the following commands and keep it open in terminal" 
echo ""
echo ""
echo "cd /opt/cot-gen" 
echo "./script.sh"
echo ""
echo ""
echo "Simotaniously open another terminal instance and run the following command to activate Node-Red"
echo ""
echo ""
echo "node-red" 
echo ""
echo ""
echo "Then head to your browser go to http://<Insert_Your_IP_Address/FQDN_HERE>:1880"