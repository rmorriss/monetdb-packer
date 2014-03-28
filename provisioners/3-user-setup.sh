#!/bin/bash

#######################################################
# User setup
#######################################################
echo "USER SETUP"
# setup monetdb and rstats users
useradd monetdb
useradd rstats
mkdir -p /home/monetdb /home/rstats
chown monetdb /home/monetdb
chown rstats /home/rstats
usermod -d /home/monetdb monetdb
usermod -d /home/rstats rstats
usermod -a -G monetdb rstats
