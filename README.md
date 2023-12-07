# CoT-Generation from Survey123 Data #

This script automates the installation of necessary dependencies and formats everything for COT-Generation from Survey123 Data.
![CoTBreakdown](img/CoTBreakdown.png?raw=true "CoTBreakdown")
## Testing ###
This script has been validated and will work for Ubuntu20.04 / 22.04 / 23.04 & CentOS7.<br />
It has not been tested on any Windows.

## LINKS ## 

**[Survey123 to CoT Google Sheet](https://docs.google.com/spreadsheets/d/1MoyjPxG49XpDrhbqdJYYgW4T7DQ8FachH2EN8Wm-N4o)** <br /><br />
**[MAKE](https://us1.make.com/)**<br />


## Usage ##

Run the script (After Install): 
```bash
cd /opt/cot-gen
./script.sh
```

## Github Install ##
MAKE SURE YOU HAVE SET YOUR GOOGLE SHEET TO "ANYONE WITH LINK"
Centos/RedHat
```bash
sudo yum install git && cd /tmp && git clone https://github.com/jpat-12/CoT-Generation-Broadcast.git && cd CoT-Generation-Broadcast && chmod +x centos.sh && ./centos.sh
```
Ubuntu/Debian
```bash
sudo apt install git && cd /tmp && git clone https://github.com/jpat-12/CoT-Generation-Broadcast.git && cd CoT-Generation-Broadcast && chmod +x ubuntu.sh && ./ubuntu.sh
```
## Post Github Install (Node-Red Formating) ##

Access node-red via: 
1. http://127.0.0.1:1880


## TO DO ##
1. Push iconsets automatically to TAKServer
2. Video Instructions/Demo


## Iconset Creation Script ## 
```bash
sudo mkdir -p /opt/icons && git clone https://github.com/jpat-12/Incident-Icons.git /opt/icons
```
```bash
cd /tmp && git clone https://github.com/jpat-12/CoT-Generation-Broadcast.git && cd CoT-Generation-Broadcast && cd iconset && chmod +x iconset-gen.sh && ./iconset-gen.sh
```