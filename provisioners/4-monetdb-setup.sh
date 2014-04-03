#!/bin/bash

#######################################################
# MonetDB setup
#######################################################
echo "MONETDB SETUP"
chsh -s "/bin/bash" monetdb
# create dbfarm and rig .monetdb file for monetdb user
runuser -l monetdb -c 'monetdbd create /var/monetdb5/dbfarm'
# enable start of MonetDB at system startup
echo "[Unit]
Description=MonetDB Server
After=syslog.target network.target auditd.service

[Service]
Type=forking
ExecStart=/usr/bin/monetdbd start /var/monetdb5/dbfarm
ExecStop=/usr/bin/monetdb stop /var/monetdb5/dbfarm
User=monetdb
Group=monetdb

[Install]
WantedBy=multi-user.target" > ~/monetdb.service

mv ~/monetdb.service /lib/systemd/system/
ln -s /lib/systemd/system/monetdb.service  /etc/systemd/system/monetdb.service
chkconfig monetdb on
service monetdb start

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
