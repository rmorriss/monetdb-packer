#!/bin/bash

#######################################################
# User shell setup
#######################################################
# monetdb and rstats shells
echo "USER SHELL SETUP"

# Set the monetdbshell.sh shell
sudo mv ~/monetdbshell.sh /home/monetdb/
sudo chmod +x /home/monetdb/monetdbshell.sh
sudo chsh -s "/home/monetdb/monetdbshell.sh" monetdb

# Set the rshell.sh shell
sudo mv ~/rshell.sh /home/rstats/
sudo chmod +x /home/rstats/rshell.sh
sudo chsh -s "/home/rstats/rshell.sh" rstats
