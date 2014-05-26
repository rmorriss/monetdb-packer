#!/bin/bash

##################################################################
# Install MonetDB, R and other required (and some useful packages)
##################################################################
echo "PACKAGE INSTALL"
# Enable EPEL repo
sudo yum install -y http://ftp.nluug.nl/pub/os/Linux/distr/fedora-epel/6/x86_64/epel-release-6-8.noarch.rpm
# Enable MonetDB repo
sudo yum install -y https://www.monetdb.org/downloads/epel/MonetDB-release-epel6-1.0-1.el6.noarch.rpm
sudo yum install -y MonetDB-SQL-server5 MonetDB-client MonetDB-geom-MonetDB5 R vsftpd nano wget
