#!/bin/bash

echo "MONETDBD SERVICE SETUP"
# change shell for the monetdb user
sudo chsh -s "/bin/bash" monetdb

# create dbfarm
sudo -u monetdb -i monetdbd create /var/monetdb5/dbfarm

# enable start of MonetDB at system startup
sudo cp ~/monetdbd.centos /etc/init.d/monetdbd
sudo chmod +x /etc/init.d/monetdbd
sudo chkconfig --add monetdbd
sudo chkconfig monetdbd on
sudo service monetdbd start
