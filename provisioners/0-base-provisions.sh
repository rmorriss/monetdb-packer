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
package-cleanup --oldkernels --count=1

#######################################################
# Set a different shell titlebar settings
#######################################################
echo "
# shell titlebar settings
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> .bashrc

#######################################################
# Set welcome message with some info how to log in
#######################################################
# Set a new welcome banner
echo "========================================
MonetDB.R Analytical Database Appliance
========================================
For user setup login with SSH as root and run
sh user-setup.sh
" > /etc/issue

# Update the welcome message on every network interface change
# Make the script executable
chmod +x /sbin/ifup-local

#######################################################
# Configure services
#######################################################
# Make sure important services are on
chkconfig network on
chkconfig sshd on
service sshd start
