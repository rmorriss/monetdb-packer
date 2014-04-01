#!/bin/bash

#######################################################
# User shell setup
#######################################################
# monetdb and rstats shells
echo "USER SHELL SETUP"

# Set the monetdbshell.sh shell
mv ~/monetdbshell.sh /home/monetdb/
chmod +x /home/monetdb/monetdbshell.sh
chsh -s "/home/monetdb/monetdbshell.sh" monetdb

# Set the rshell.sh shell
mv ~/rshell.sh /home/rstats/
chmod +x /home/rstats/rshell.sh
chsh -s "/home/rstats/rshell.sh" rstats
