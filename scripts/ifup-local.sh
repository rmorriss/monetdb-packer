#!/bin/bash

sed -i_bak -e '/IP addres/d' /etc/issue
IPADD=`hostname -I`
echo "IP address: $IPADD" >> /etc/issue
