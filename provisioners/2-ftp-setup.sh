#!/bin/bash

#######################################################
# setup FTP server for file IO
#######################################################
echo "FTP SETUP"
sudo grep -v "shells" /etc/pam.d/vsftpd  > ~/vsftpd
sudo mv /etc/pam.d/vsftpd /etc/pam.d/vsftpd.backup
sudo mv ~/vsftpd /etc/pam.d/vsftpd

# Enable the service
sudo chkconfig vsftpd on
sudo service vsftpd start
