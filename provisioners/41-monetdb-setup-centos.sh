#!/bin/bash

#######################################################
# MonetDB setup
#######################################################
echo "MONETDB SETUP"
# change shell for the monetdb user
sudo chsh -s "/bin/bash" monetdb

# create dbfarm and rig .monetdb file for monetdb user
sudo -u monetdb -i monetdbd create /var/monetdb5/dbfarm
# enable start of MonetDB at system startup
sudo cp ~/monetdbd.service /etc/init.d/monetdbd
sudo chmod +x /etc/init.d/monetdbd
sudo chkconfig --add monetdbd
sudo chkconfig monetdbd on
sudo service monetdbd start

# create default database "db"
sudo -u monetdb -i monetdb create db
sudo -u monetdb -i monetdb release db
sudo -u monetdb -i monetdb start db

# set config file for admin management if that was not done already
if [ ! -f ~/.monetdb ]; then
    echo -e "user=monetdb\npassword=monetdb" > ~/.monetdb
fi

# now lock the monetdb admin user with a random password s.t. only OS root user can still connect using the .monetdb file, but others can't (also not by looking at the VM image)
mpw=`openssl rand -base64 14`
mclient db -s "alter user set unencrypted password '$mpw' using old password 'monetdb'";
echo -e "user=monetdb\npassword=$mpw" > ~/.monetdb

# Make the load-voc-data scirpt executable
chmod +x load-voc-data.sh
