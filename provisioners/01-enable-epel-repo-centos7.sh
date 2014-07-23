#!/bin/bash

##################################################################
# Enable EPEL repo
##################################################################
echo "ENABLE EPEL REPO"
sudo yum install -y http://ftp.nluug.nl/pub/os/Linux/distr/fedora-epel/beta/7/x86_64/epel-release-7-0.2.noarch.rpm
sudo yum update -y
sudo yum upgrade -y
