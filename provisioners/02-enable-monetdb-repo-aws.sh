#!/bin/bash

echo "ENABLE MONETDB REPO"
# Enable MonetDB repo
sudo rpm --import http://dev.monetdb.org/downloads/MonetDB-GPG-KEY
sudo cp monetdb.repo /etc/yum.repos.d/monetdb.repo
sudo yum update
