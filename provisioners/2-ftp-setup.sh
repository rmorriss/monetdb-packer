#!/bin/bash

#######################################################
# setup FTP server for file IO
#######################################################
echo "FTP SETUP"
grep -v "shells" /etc/pam.d/vsftpd  > ~/vsftpd
mv /etc/pam.d/vsftpd /etc/pam.d/vsftpd.backup
mv ~/vsftpd /etc/pam.d/vsftpd

# Set SELinux permissions
setsebool -P allow_ftpd_full_access=1
# Enable the service
chkconfig vsftpd on
service vsftpd start
