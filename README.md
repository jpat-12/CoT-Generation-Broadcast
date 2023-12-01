# CoT-Generation from Survey123 Data ##

This script automates the installation of necessary dependencies and formats everything for COT-Generation from Survey123 Data.

## Testing ###
This script has been validated and will work for Ubuntu20.04 / 22.04 / 23.04.
It has not been tested on any CentOS Release or Windows.


## Usage ##

Run the script (After Install): 
```
cd /opt/cot-gen
./script.sh
```

## Install ##
Follow all prompts etc
Centos/RedHat
```
sudo yum install git
```
Ubuntu/Debian
```
sudo apt install git
```
```
cd /tmp && git clone https://github.com/jpat-12/CoT-Generation-Broadcast.git && cd CoT-Generation-Broadcast && chmod +x dependancy-install.sh && ./dependancy-install.sh
```
## Post Install ##

Access node-red via: 

1. http://INSERT_IP_ADDRESS_HERE:1880 
2. http://127.0.0.1:1880


## TO DO ##
1. Icon Set Creation Automation 
2. Push Iconsets automatically to TAKServer
3. Video Instructions/Demo
