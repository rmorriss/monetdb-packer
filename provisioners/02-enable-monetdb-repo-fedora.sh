#!/bin/bash

echo "ENABLE MONETDB REPO"
# Enable MonetDB repo
sudo yum install -y http://dev.monetdb.org/downloads/Fedora/MonetDB-release-1.1-1.monetdb.noarch.rpm
sudo yum update
