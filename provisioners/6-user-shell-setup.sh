#!/bin/bash

#######################################################
# User shell setup
#######################################################
# monetdb and rstats shells
echo "USER SHELL SETUP"
echo '#!/bin/sh
mclient db
echo
read -p "Press [Enter] key to exit session..."
' > ~/monetshell.sh
echo "# shell titlebar settings
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> monetshell.sh
mv ~/monetshell.sh /home/monetdb/
chmod +x /home/monetdb/monetshell.sh
chsh -s "/home/monetdb/monetshell.sh" monetdb

echo '#!/bin/sh
R
echo
read -p "Press [Enter] key to exit session..."
' > ~/rshell.sh
echo "# shell titlebar settings
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> rshell.sh
mv ~/rshell.sh /home/rstats/
chmod +x /home/rstats/rshell.sh
chsh -s "/home/rstats/rshell.sh" rstats

