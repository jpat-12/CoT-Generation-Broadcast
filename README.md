# CoT-Generation from Survey123 Data #

![S123](img/S123.png?raw=true "S123")


This script automates the installation of necessary dependencies and formats everything for COT-Generation from Survey123 Data.

## Testing ###
This script has been validated and will work for Ubuntu20.04 / 22.04 / 23.04 & CentOS7.
It has not been tested on any Windows.

## Getting Started ## 

**[Survey123 to CoT Google Sheet](https://docs.google.com/spreadsheets/d/1MoyjPxG49XpDrhbqdJYYgW4T7DQ8FachH2EN8Wm-N4o) <br />
[MAKE](https://us1.make.com/)<br />
![CoTBreakdown](img/CoTBreakdown.png?raw=true "CoTBreakdown")


## Usage ##

Run the script (After Install): 
```bash
cd /opt/cot-gen
./script.sh
```

## Install ##
Follow all prompts etc
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
## Post Install ##

Access node-red via: 

1. http://INSERT_IP_ADDRESS_HERE:1880 
2. http://127.0.0.1:1880


## TO DO ##
1. Icon Set Creation Automation 
2. Push Iconsets automatically to TAKServer
3. Video Instructions/Demo
