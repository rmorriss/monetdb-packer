#!/bin/bash

##################################################################
# Install R and other required (and some useful packages)
##################################################################
echo "PACKAGE INSTALL OTHER"
# Install R
sudo yum install -y R

# Install other needed packages
sudo yum install -y vsftpd nano wget
