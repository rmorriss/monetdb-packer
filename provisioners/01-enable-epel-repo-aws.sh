#!/bin/bash

##################################################################
# Enable EPEL repo
##################################################################
echo "ENABLE EPEL REPO"
sudo yum-config-manager --enable epel
sudo yum update -y
sudo yum upgrade -y
