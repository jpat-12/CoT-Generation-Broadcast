# CoT-Generation from Survey123 Data #

This script automates the installation of necessary dependencies and formats everything for COT-Generation from Survey123 Data.
![CoTBreakdown](img/CoTBreakdown.png?raw=true "CoTBreakdown")
## Testing ###
This script has been validated and will work for Ubuntu20.04 / 22.04 / 23.04 & CentOS7.<br />
It has not been tested on any Windows.

## Getting Started ## 

**[Survey123 to CoT Google Sheet](https://docs.google.com/spreadsheets/d/1MoyjPxG49XpDrhbqdJYYgW4T7DQ8FachH2EN8Wm-N4o)** <br /><br />
**[MAKE](https://us1.make.com/)**<br />


## Usage ##

Run the script (After Install): 
```bash
cd /opt/cot-gen
./script.sh
```

## Github Install ##
Centos/RedHat
```bash
sudo yum install git
cd /tmp && git clone https://github.com/jpat-12/CoT-Generation-Broadcast.git && cd CoT-Generation-Broadcast && chmod +x centos.sh && ./centos.sh

```
Ubuntu/Debian
```bash
sudo apt install git
cd /tmp && git clone https://github.com/jpat-12/CoT-Generation-Broadcast.git && cd CoT-Generation-Broadcast && chmod +x ubuntu.sh && ./ubuntu.sh

```
## Post Github Install (Node-Red Formating) ##

Access node-red via: 
1. http://127.0.0.1:1880


## TO DO ##
1. Icon Set Creation Automation 
2. Push Iconsets automatically to TAKServer
3. Video Instructions/Demo
