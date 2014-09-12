#!/bin/bash

echo "ENABLE MONETDB REPO"
# Enable MonetDB repo
sudo yum install -y https://dev.monetdb.org/downloads/epel/MonetDB-release-epel-1.1-1.monetdb.noarch.rpm
sudo yum update
