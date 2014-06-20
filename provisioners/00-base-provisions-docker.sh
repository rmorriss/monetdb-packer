#!/bin/bash

###########################################################
# Install sudo, update system and remove undeeded packages
###########################################################
echo "BASE PROVISION"
yum install sudo -y
sudo yum update -y
sudo yum upgrade -y
