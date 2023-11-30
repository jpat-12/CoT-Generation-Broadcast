#!/bin/bash

while true
do
    # Run excel-download.sh
    ./csv-download.sh
clear
    # Run kml-gen_icon_test.py
    python3 /opt/cot-gen/convert-csv.py
    echo "File Created"
sleep 2
clear
    # The KML is now in /var/www/html
    echo 'Now Changeing Permissions' 
    cp /var/www/html/COT-BROADCAST.xml /var/www/html/COT-BROADCAST.txt
    sudo chmod 644 /var/www/html/COT-BROADCAST.txt
    sudo chmod 644 /var/www/html/COT-BROADCAST.xml
    sudo chmod +r /var/www/html/
    echo '--------------------------------------'
    echo 'Permissions Have Been Changed'
    echo '--------------------------------------'
  done
