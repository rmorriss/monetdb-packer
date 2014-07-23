#!/bin/bash

#######################################################
# User setup
#######################################################
echo "USER SETUP"
# setup monetdb and rstats users
sudo useradd monetdb
sudo useradd rstats
sudo mkdir -p /home/monetdb /home/rstats
sudo chown monetdb /home/monetdb
sudo chown rstats /home/rstats
sudo usermod -d /home/monetdb monetdb
sudo usermod -d /home/rstats rstats
sudo usermod -a -G monetdb rstats

# Set a different shell titlebar settings and welcome message for root
echo "
# shell titlebar settings
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
" >> .bashrc
