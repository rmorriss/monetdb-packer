#!/bin/bash

#######################################################
# Set motd
#######################################################
echo "Set motd"

echo "
========================================
MonetDB+R Analytical Database Appliance
https://monetdb.org
https://monetdbsolutions.com
========================================

For first-time user setup run:
'sh user-setup.sh'" | sudo tee -a /etc/motd > /dev/null
