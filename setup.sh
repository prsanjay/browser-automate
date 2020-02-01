#!/bin/bash

crontab -l > mycron
echo "20 10 * * 1,2,3,4,5 export DISPLAY=:0; ~/browser-automate/keka.sh >> ~/browser-automate/cronOutput.txt 2>&1" >> mycron
echo "20 19 * * 1,2,3,4,5 export DISPLAY=:0; ~/browser-automate/keka.sh >> ~/browser-automate/cronOutput.txt 2>&1" >> mycron
crontab mycron
rm mycron