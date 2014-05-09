#!/bin/bash

#######################################################
# MonetDB setup
#######################################################
echo "MONETDB SETUP"
# change shell for the monetdb user
chsh -s "/bin/bash" monetdb

# open port 50000
iptables -A INPUT -m state --state NEW -p tcp --dport 50000 -j ACCEPT
/etc/init.d/iptables restart

# create dbfarm and rig .monetdb file for monetdb user
runuser -l monetdb -c 'monetdbd create /var/monetdb5/dbfarm'
# enable start of MonetDB at system startup
cp ~/monetdbd.service /etc/init.d/monetdbd
chmod +x /etc/init.d/monetdbd
chkconfig --add monetdbd
chkconfig monetdbd on
service monetdbd start

# create default database "db"
runuser -l monetdb -c 'monetdb create db && monetdb release db && monetdb start db'

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
