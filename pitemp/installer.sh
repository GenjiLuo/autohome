#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi
echo "Make sure all the files are in /home/pi/pitemp/ (Including this installer)"
echo "DON\'T FORGET TO PUT YOUR AIO KEY in /home/pi/autohome/aiokey.txt!!!"
echo "Installing adafruit-io python package"
pip3 install adafruit-io
echo "Adding autohome service to your system"
cp /home/pi/pitemp/pitemp.service /etc/systemd/system/
echo "Reloading systemctl daemon"
systemctl daemon-reload
echo "Starting service"
systemctl start pitemp
echo "Enabling service on boot"
systemctl enable pitemp
echo "Done! To start and stop the service, run \"service autohome start\" as root :D"
echo "To edit this program, you can modify the driver.py file in this directory"
echo "DON\'T FORGET TO PUT YOUR AIO KEY in /home/pi/autohome/aiokey.txt!!!"
