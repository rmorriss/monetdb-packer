#!/bin/bash

echo "MONETDBD SERVICE SETUP"
# change shell for the monetdb user
sudo chsh -s "/bin/bash" monetdb

# create dbfarm
sudo -u monetdb -i monetdbd create /var/monetdb5/dbfarm

# enable start of MonetDB at system startup
sudo cp ~/monetdbd.service /lib/systemd/system/
sudo ln -s /lib/systemd/system/monetdbd.service  /etc/systemd/system/monetdbd.service
sudo chkconfig monetdbd on
sudo service monetdbd start
