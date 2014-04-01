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

# Set a different shell titlebar settings and welcome message for root
echo "
# shell titlebar settings
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
" >> .bashrc

#
echo "
For first-time user setup run:
'sh user-setup.sh'" >> /etc/motd
