#!/bin/bash

#######################################################
# RStudio setup
#######################################################
echo "RStudio SETUP"

# install RStudio
sudo yum install --nogpgcheck -y http://download2.rstudio.org/rstudio-server-0.98.507-x86_64.rpm

# copy rserver.conf in place
cp rserver.conf /etc/rstudio/rserver.conf
# create rsession.conf
touch /etc/rstudio/rsession.conf

# start
sudo rstudio start
