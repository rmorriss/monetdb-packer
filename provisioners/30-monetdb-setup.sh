#!/bin/bash

#######################################################
# MonetDB setup
#######################################################
echo "MONETDB SETUP"
chsh -s "/bin/bash" monetdb
# create dbfarm
runuser -l monetdb -c 'monetdbd create /var/monetdb5/dbfarm'

# enable start of MonetDB at system startup
mv ~/monetdbd.service /lib/systemd/system/
ln -s /lib/systemd/system/monetdbd.service  /etc/systemd/system/monetdbd.service
chkconfig monetdbd on
service monetdbd start

# create default database "db" and release it
runuser -l monetdb -c 'monetdb create db && monetdb release db'

# set config file for admin management if that was not done already
if [ ! -f ~/.monetdb ]; then
    echo -e "user=monetdb\npassword=monetdb" > ~/.monetdb
fi

# now lock the monetdb admin user with a random password s.t. only OS root user can still connect using the .monetdb file, but others can't (also not by looking at the VM image)
mpw=`openssl rand -base64 14`
mclient db -s "alter user set unencrypted password '$mpw' using old password 'monetdb'";
echo -e "user=monetdb\npassword=$mpw" > ~/.monetdb

# Start the new database "db"
runuser -l monetdb -c 'monetdb start db'

# Make the user-setup and load-voc-data scirpt executable
chmod +x user-setup.sh
chmod +x load-voc-data.sh
