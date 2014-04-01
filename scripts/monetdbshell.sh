#!/bin/bash

# shell titlebar settings
printf '\033]2;'${USER}'@'${HOSTNAME}'\007'

# drop into mclient
mclient db
echo
read -p "Press [Enter] key to exit session..."
