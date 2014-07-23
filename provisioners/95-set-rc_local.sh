#!/bin/bash

#######################################################
# Set rc.local
#######################################################
echo "SET RC.LOCAL"
# That scritp will update the welcome message on every network interface change
# Packer will uploaded it in place
# Make the script executable
chmod +x /sbin/ifup-local

# Add the ifup-local scirpt to the rc.local
echo "#!/bin/bash

/sbin/ifup-local" > /etc/rc.d/rc.local
# Make rc.local executable
chmod +x /etc/rc.d/rc.local
