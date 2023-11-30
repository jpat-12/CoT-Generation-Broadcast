#!/bin/bash
echo ""
echo ""
echo "This script will install the necessary dependancies & format everything for COT-GENERATION from Survey123 Data"
echo ""
echo ""
read -p "Press any key to begin ..."

python3 --version
sudo apt install unzip 
sudo apt install curl


curl -L -o /opt/cot-gen.zip https://drive.google.com/uc?export=download&id=1edkOVBN3wBXJGZaV5x3ZSR7AV7KFUmAi
