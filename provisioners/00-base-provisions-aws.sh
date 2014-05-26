#!/bin/bash

#######################################################
# Update system and remove undeeded packages
#######################################################
echo "BASE PROVISION"
sudo yum update -y
sudo yum upgrade -y
