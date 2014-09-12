#!/bin/bash

##################################################################
# Enable EPEL repo
##################################################################
echo "ENABLE EPEL REPO"
sudo yum install -y epel-release
sudo yum update -y
sudo yum upgrade -y
