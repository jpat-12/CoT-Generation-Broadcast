# CoT-Generation from Survey123 Data #

This script automates the installation of necessary dependencies and formats everything for COT-Generation from Survey123 Data.
![CoTBreakdown](img/CoTBreakdown.png?raw=true "CoTBreakdown")


## LINKS ## 
**[Youtube Install Walkthrough](https://docs.google.com/spreadsheets/d/1MoyjPxG49XpDrhbqdJYYgW4T7DQ8FachH2EN8Wm-N4o)** <br /><br />
**[Survey123 to CoT Google Sheet](https://docs.google.com/spreadsheets/d/1MoyjPxG49XpDrhbqdJYYgW4T7DQ8FachH2EN8Wm-N4o)** <br /><br />
**[MAKE](https://us1.make.com/)**<br />


## Usage ##
```bash
cd /opt/cot-gen && ./script.sh
```

## Centos/RedHat Install ##
```bash
sudo yum install git && cd /tmp && git clone https://github.com/jpat-12/CoT-Generation-Broadcast.git && cd CoT-Generation-Broadcast && chmod +x centos.sh && ./centos.sh && cd /opt/cot-gen
```
## Ubuntu/Debian Install ##
```bash
sudo apt install git && cd /tmp && git clone https://github.com/jpat-12/CoT-Generation-Broadcast.git && cd CoT-Generation-Broadcast && chmod +x ubuntu.sh && ./ubuntu.sh && cd /opt/cot-gen
```

## Troubleshooting ##
1. Make sure your Google Sheets sharing is set to anyone with link 
2. Make sure you have the "Event" sheet all the way to the left hand side of the screen inside Google Sheets 
3. Make sure your cert.pem & key.pem files are not at 0 kb. This could be the case if you typed your password in wrong.
```bash
cd /opt/tak/certs/files && openssl pkcs12 -clcerts -nokeys -in Survey123.p12 -out Survey123.cert.pem && openssl pkcs12 -nocerts -nodes -in Survey123.p12 -out Survey123.key.pem

``` 
4. Make sure your Node-Red file call is correct
5. Make sure you are running the script.sh (/opt/cot-gen/script.sh) and Node Red at the same time. 
6. If there are no errors in the log, but nothing happens check that the node red server is running by going to http://localhost:1880




## TO DO ##
1. Push iconsets automatically to TAKServer

## Iconset Creation Script ## 
```bash
sudo mkdir -p /opt/icons && git clone https://github.com/jpat-12/Incident-Icons.git /opt/icons
```
```bash
cd /tmp && git clone https://github.com/jpat-12/CoT-Generation-Broadcast.git && cd CoT-Generation-Broadcast && cd iconset && chmod +x iconset-gen.sh && ./iconset-gen.sh
```