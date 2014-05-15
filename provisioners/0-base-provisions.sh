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
# Set welcome message with some info how to log in
#######################################################
# Set a new welcome banner
echo "========================================
MonetDB+R Analytical Database Sandbox
https://monetdb.org
https://monetdbsolutions.com
========================================
To login remotely use:
'ssh -p 2222 root@127.0.0.1'
Default password: monetdb

For first-time user setup login and run:
'sh user-setup.sh'
" > /etc/issue


# That scritp will update the welcome message on every network interface change
# Packer will uploaded it in place
# Make the script executable
chmod +x /sbin/ifup-local

# Add the ifup-local scirpt to the rc.local
echo "#!/bin/bash

/sbin/ifup-local" > /etc/rc.d/rc.local
# Make rc.local executable
chmod +x /etc/rc.d/rc.local

#######################################################
# Configure services
#######################################################
# Make sure important services are on
chkconfig network on
chkconfig sshd on
service sshd start
