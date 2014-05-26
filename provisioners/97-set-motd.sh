#!/bin/bash

#######################################################
# Set motd
#######################################################
echo "Set motd"

echo "
=============================================
MonetDB Analytical Database Appliance with R
https://monetdbsolutions.com
=============================================

For first-time user setup run:
'sh user-setup.sh'" | sudo tee -a /etc/motd > /dev/null
