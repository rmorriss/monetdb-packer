#!/bin/bash

#######################################################
# Update system and remove undeeded packages
#######################################################
echo "BASE PROVISION"
yum remove -y @gnome-desktop
# Cleanup other packages we do not need
yum groupremove -y "Dialup Networking Support" "Printing Support" "Additional Development" "E-mail server"
yum update -y
yum upgrade -y
# Install some needed packages
yum install -y yum-utils wget
# Remove old kernels
package-cleanup -y --oldkernels --count=1

#######################################################
# Configure services
#######################################################
# Make sure important services are on
chkconfig network on
chkconfig sshd on
service sshd start
