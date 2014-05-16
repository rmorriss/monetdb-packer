#!/bin/bash

#######################################################
# Set MoTD
#######################################################
echo "Set MoTD"

sudo echo "
For first-time user setup run:
'sh user-setup.sh'" >> /etc/motd
