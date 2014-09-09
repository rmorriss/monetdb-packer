#!/bin/bash

##################################################################
# Install MonetDB, R and other required (and some useful packages)
##################################################################
echo "PACKAGE INSTALL"
# Enable MonetDB repo
sudo yum install -y https://dev.monetdb.org/downloads/epel/MonetDB-release-epel-1.1-1.monetdb.noarch.rpm
sudo yum install -y MonetDB-SQL-server5 MonetDB-client MonetDB-geom-MonetDB5

# Install R
sudo yum install -y R

# Install other needed packages
sudo yum install -y vsftpd nano wget
