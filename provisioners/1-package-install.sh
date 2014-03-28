#!/bin/bash

##################################################################
# Install MonetDB, R and other required (and some useful packages)
##################################################################
echo "PACKAGE INSTALL"
sudo yum install -y http://dev.monetdb.org/downloads/Fedora/MonetDB-release-1.1-1.monetdb.noarch.rpm
sudo yum install -y MonetDB-SQL-server5 MonetDB-client MonetDB-geom-MonetDB5 R vsftpd nano
