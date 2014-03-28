#!/bin/bash

#######################################################
# Extra base provisions for CentOS
#######################################################
# Enable EPEL repo
yum install -y http://ftp.nluug.nl/pub/os/Linux/distr/fedora-epel/6/x86_64/epel-release-6-8.noarch.rpm

# Turn-off un-needed services
chkconfig sendmail off
chkconfig vbox-add-x11 off
chkconfig smartd off
chkconfig ntpd off
chkconfig cupsd off